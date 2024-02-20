import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(
      //moving based on Y axis since it's a Column.
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // styled TextButton Widget
        TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              backgroundColor: MaterialStatePropertyAll(Colors.blue)),
          onPressed: null,
          child: Text("Click Me"),
        ),
        // Text Widget for a message...
        Text("The message should appear here...")
      ],
    ))));
  }
}
