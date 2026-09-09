import 'package:flutter/material.dart';

class TextBoxDemonstrate extends StatefulWidget {
  const TextBoxDemonstrate({super.key});

  @override
  State<TextBoxDemonstrate> createState() =>
      _TextBoxDemonstrateState();
}

class _TextBoxDemonstrateState extends State<TextBoxDemonstrate> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void setText() {
    textController.text = "Hello World";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Controller"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: "Enter Text",
                  border: OutlineInputBorder(),
                ),
                onChanged: (_) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              Text(
                "Read Text: ${textController.text}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: setText,
                child: const Text("Set Text"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

