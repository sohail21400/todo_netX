import 'package:flutter/material.dart';
import 'package:todo/screens/home_page.dart';

// This is the main function
void main() => runApp(MyApp());

// why is this a stateful widget, because it's state (look) changes when user taps the screen
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// This is how we define a stateful widget
class _MyAppState extends State<MyApp> {
  // build() function builds the UI
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // here we can define the overall theme of the app
      theme: ThemeData(
        accentColor: Colors.purpleAccent,
        primaryColor: Colors.purple,
      ),
      // home: CreateToDoPage(),
      home: HomePage(),
    );
  }
}
