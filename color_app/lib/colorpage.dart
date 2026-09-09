import 'package:flutter/material.dart';

class ColorPage extends StatefulWidget {
  ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  var colors = [Colors.yellow, Colors.red, Colors.green, Colors.blue];

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Page')),
      body: Column(
        children: [
          Expanded(child: Container(color: colors[(0 + count) % 4])),
          Expanded(child: Container(color: colors[(1 + count) % 4])),
          Expanded(child: Container(color: colors[(2 + count) % 4])),
          Expanded(child: Container(color: colors[(3 + count) % 4])),

          Expanded(
            child: ElevatedButton(
              onPressed: () {
                count++;
                setState(() {
                  
                });
                print("button clicked $count");
              },
              child: Text('Change'),
            ),
          ),
        ],
      ),
    );
  }
}