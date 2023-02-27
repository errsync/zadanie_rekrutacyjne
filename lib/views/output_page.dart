import 'package:flutter/material.dart';


// This Class will display the output
class OutputPage extends StatelessWidget {
  final int valueToOut;

// Constructor to receive the string from InputPage
  OutputPage({Key? key, required this.valueToOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '$valueToOut',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
