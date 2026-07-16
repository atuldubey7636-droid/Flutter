import 'package:flutter/material.dart';
import 'dart:async';

class StopWatchExample extends StatefulWidget {
  const StopWatchExample({super.key});

  @override
  State<StopWatchExample> createState() => _StopWatchExampleState();
}

class _StopWatchExampleState extends State<StopWatchExample> {
  int seconds = 0;
  late Timer timer;
  bool isRunning = false;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), _onTick);
  }

  @override
  void dispose(){
    timer.cancel();
    super.dispose();
  }

  void _onTick(Timer timer){
    setState(() {
      if (isRunning){
        seconds++;
      }
    });
  }

  void _startTimer(){
    setState(() {
      isRunning = true;
    });
  }


  void _stopTimer(){
    setState(() {
      isRunning = false;
    });
  }


  String _secondToText() => seconds == 1 ? "1 second" : "$seconds seconds";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stopwatch example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
            _secondToText(),
            style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            ElevatedButton(
              onPressed: _startTimer,
              style: ButtonStyle(
                backgroundColor: 
                  MaterialStateProperty.all<Color>(Colors.green),
                  foregroundColor: 
                    MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text("Start"),
            ),
            const SizedBox(width: 20,),
            ElevatedButton(
              onPressed: _stopTimer,
              style: ButtonStyle(
                backgroundColor: 
                  MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor: 
                    MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text("Stop"),
            )
          ],)

        ],
      ),
    );
  }
}