import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontFamily: 'Roboto'
              )),
          backgroundColor: Colors.blueAccent,
          leading: const Icon(Icons.menu),
        ),
        body: Column(
                      children: [
                        Container(
                          height: 100,
                          color: Colors.red,
                          child: const Center(
                            child: Text("Container 1",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) ) ,)
                        ),
                        Container(
                          height: 50,
                          color: const Color.fromARGB(255, 86, 244, 54),
                          child: const Center(
                            child: Text("Container 2",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) ) ,)
                        ),
                        Container(
                          height: 30,
                          color: const Color.fromARGB(255, 54, 76, 244),
                          child: const Center(
                            child: Text("Container 3",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) ) ,)
                        ),
                        Container(
                          height: 10,
                          color: const Color.fromARGB(255, 54, 244, 241),
                          child: const Center(
                            child: Text("Container 4",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) ) ,)
                        )
                      ],
            //   Text("Hello World!",
            //     style: 
            //       TextStyle(fontSize:30, fontWeight:FontWeight.bold)),
            //   Text("Welcome to flutter",
            //     style: 
            //       TextStyle(fontSize:30, fontWeight:FontWeight.bold)),
            //   Text("This is a simple flutter app",
            //     style: 
            //       TextStyle(fontSize:30, fontWeight:FontWeight.bold)),
            //   Text("Enjoy coding",
            //     style: 
            //       TextStyle(fontSize:30, fontWeight:FontWeight.bold))
            // ]),
                    ),
     ),
    );
  }
}
