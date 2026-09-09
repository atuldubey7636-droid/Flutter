import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchExample extends StatefulWidget {
  const StopwatchExample({super.key});
  @override
  State<StopwatchExample> createState() => _StopwatchExampleState();
}

class _StopwatchExampleState extends State<StopwatchExample> {
  Timer? timer;
  bool isRunning = false;
  int milliseconds = 0;
  final List<int> laps = <int>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _onTick(Timer timer) {
    setState(() {
      if (isRunning) {
        milliseconds += 100;
      }
    });
  }

  void _startTimer() {
    if (isRunning) {
      return;
    }

    timer ??= Timer.periodic(const Duration(milliseconds: 100), _onTick);
    setState(() {
      isRunning = true;
    });
  }

  void _lapTimer() {
    if (!isRunning) {
      return;
    }

    setState(() {
      laps.add(milliseconds);
    });
  }
  void _clearTimer() {
    timer?.cancel();
    timer = null;
    setState(() {
      isRunning = false;
      milliseconds = 0;
      laps.clear();
    });
  }

 

  // ignore: strict_top_level_inference
  String _millisToSeconds(milis) {
    final totalMilliseconds = milis as int;
    final minutes = totalMilliseconds ~/ 60000;
    final seconds = (totalMilliseconds % 60000) ~/ 1000;
    final hundredths = (totalMilliseconds % 1000) ~/ 10;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${hundredths.toString().padLeft(2, '0')}';

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stopwatch Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Center(
              child: Text(
                _millisToSeconds(milliseconds),
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: isRunning ? null : _startTimer,
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.green),
                  foregroundColor:
                      WidgetStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Start'),
              ),
              ElevatedButton(
                onPressed: isRunning ? _lapTimer : null,
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.orange),
                  foregroundColor:
                      WidgetStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Lap'),
              ),
              ElevatedButton(
                onPressed: isRunning ? null : _clearTimer,
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      WidgetStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Clear'),
              ),
              
            ]),
            const SizedBox(height: 24),
            Expanded(
              child: laps.isEmpty
                  ? const Center(child: Text('No laps recorded yet'))
                  : ListView.separated(
                      itemCount: laps.length,
                      separatorBuilder: (context, index) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final lapTime = laps[index];
                        return ListTile(
                          leading: Text('Lap ${index + 1}'),
                          trailing: Text(_millisToSeconds(lapTime)),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ElevatedButton(
                onPressed: _clearTimer,
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      WidgetStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Clear'),
              ),
            ),
          ],
        ));
  }
}