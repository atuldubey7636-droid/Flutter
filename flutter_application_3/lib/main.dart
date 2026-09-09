import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontFamily: 'Roboto',
            ),
          ),
          backgroundColor: Colors.blue,
          leading: const Icon(Icons.menu),
          
        ),
        body: Column(

            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    
                  ),
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      "Container 1",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
          
              Expanded(
                child: Container(
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      "Conatiner 2",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
          
              Expanded(
                child: Container(
                  color: Colors.yellow,
                  child: const Center(
                    child: Text(
                      "Container 3",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
          
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      "Container 4",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              ElevatedButton(onPressed: (){
                print("Clicked Here");
              }, child: Text("Click Here"),)
            ],
          ),
        ),
    );
  }
}