import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

int evenOrOdd(List<int> list) {
  int k = 0;
  bool war1 = list[0].isEven && list[1].isEven;
  bool war2 = list[1].isEven && list[2].isEven;
  bool war3 = list[2].isEven && list[3].isEven;
  if (war1 || war2 || war3) {
    for (var n in list) {
      if (n.isOdd) {
        k = n;
      }
    }
  } else {
    for (var n in list) {
      if (n.isEven) {
        k = n;
      }
    }
  }
  return k;
}

List<int> convertToList(String text) {
  List<int> result = [];
  List<String> numbers = text.split(',');
  for (String number in numbers) {
    result.add(int.parse(number));
  }
  return result;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final textController = TextEditingController();
  List<int> numberList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your list of numbers',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the OutputPage passing the text from the textfield
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (ctx) => OutputPage(
                          valueToOut:
                              evenOrOdd(convertToList(textController.text)))),
                );
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}

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
