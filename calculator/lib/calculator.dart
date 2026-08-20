import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String display = "0";

  double? firstnumber;
  String? operator;

  void buttonPressed(String value){
    setState(() {
      if(value == "C"){
        display = "0";
        firstnumber = 0;
        operator = "0";
      }
      else if(value == "0" ||
            value == "1" ||
            value == "2" ||
            value == "3" ||
            value == "4" ||
            value == "5" ||
            value == "6" ||
            value == "7" ||
            value == "8" ||
            value == "9")
            {
              if(display == "0"){
                display = value;
              }
              else{
                display += value;
              }
            }
      else if (value == "+" ||
          value == "-" ||
          value == "×" ||
          value == "÷") {
        firstnumber = double.parse(display);
        operator = value;
        display = "0";
      }
      else if (value == "=") {
        calculate();
      }

    });
  }

  void calculate(){
    if(firstnumber == null || operator == null){
      return;
    }

    double secondnumber = double.parse(display);
    double result=0;

    switch (operator) {
      case "+":
        result = firstnumber! + secondnumber;
        break;

      case "-":
        result = firstnumber! - secondnumber;
        break;

      case "×":
        result = firstnumber! * secondnumber;
        break;

      case "÷":
        if (secondnumber == 0) {
          display = "Error";
          return;
        }

        result = firstnumber! / secondnumber;
        break;
    }

    display = result.toString();

    firstnumber = null;
    operator = null;
  }
  Widget calculatorButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () {
            buttonPressed(text);
          },
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
      ),

      body: Column(
        children: [

          // Display
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),

              child: Text(
                display,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Row 1
          Row(
            children: [
              calculatorButton("7"),
              calculatorButton("8"),
              calculatorButton("9"),
              calculatorButton("÷"),
            ],
          ),

          // Row 2
          Row(
            children: [
              calculatorButton("4"),
              calculatorButton("5"),
              calculatorButton("6"),
              calculatorButton("×"),
            ],
          ),

          // Row 3
          Row(
            children: [
              calculatorButton("1"),
              calculatorButton("2"),
              calculatorButton("3"),
              calculatorButton("-"),
            ],
          ),

          // Row 4
          Row(
            children: [
              calculatorButton("C"),
              calculatorButton("0"),
              calculatorButton("="),
              calculatorButton("+"),
            ],
          ),
        ],
      ),);
  }
}