import 'package:flutter/material.dart';

class RadioButtonDemonstrate extends StatefulWidget {
  const RadioButtonDemonstrate({super.key});

  @override
  State<RadioButtonDemonstrate> createState() => _RadioButtonDemonstrateState();
}

class _RadioButtonDemonstrateState extends State<RadioButtonDemonstrate> {
  String gender = "Male";

  void setRadioValue(){
    setState(() {
      gender = "Female";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RadioListTile<String>(
              title: Text("Male"),
              value: "Male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: Text("Female"),
              value: "Female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            Text("Select Gender : $gender"),

            ElevatedButton(
              onPressed:setRadioValue, 
              child: Text("Set Gender to Female"))

          ],
        ),
      ),
    );
  }
}