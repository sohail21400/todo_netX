import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/screens/todo_create_page.dart';

// TODO
// 1. New page for todo creation
// 2. make the check box working
// 3. user defined todo

// This is the main function
void main() => runApp(MyApp());

// why is this a stateful widget, because it's state (look) changes when user taps the screen
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// this list holds the data of todos
List<Todo> todoItems = [
  Todo("remind me", false),
  Todo("remind me to buy milk", false),
  Todo("take bath", true),
  Todo("remind me", false),
  Todo("remind me", false),
  Todo("remind me", false),
];

// This is how we define a stateful widget
class _MyAppState extends State<MyApp> {
  // --------------------------------------------------------------
  // this function converts the todo data to a todo widget
  Container todoItemWidget(Todo todoObject) {
    return Container(
      // space around the container
      margin: EdgeInsets.all(10),
      // the parameter decoration takes Decoration, BoxDecoration is a class which extends from Decoration
      decoration: BoxDecoration(
        // BorderRadius extends from BorderRadiusGeometry
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12,
      ),
      // space between the container and the child of the container
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Text(todoObject.text),
          Spacer(),
          Checkbox(
            onChanged: (value) {
              print(value);
            },
            value: todoObject.isDone,
          )
        ],
      ),
    );
  }
  // --------------------------------------------------------------

  // build() function builds the UI
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // here we can define the overall theme of the app
      theme: ThemeData(
        accentColor: Colors.purpleAccent,
        primaryColor: Colors.purple,
      ),
      home: CreateToDoPage(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text("To do"),
      //   ),
      //   floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     onPressed: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => CreateToDoPage()));
      //       print("hello");
      //     },
      //   ),
      //   body: ListView.builder(
      //     itemCount: 5,
      //     itemBuilder: (context, index) {
      //       return todoItemWidget(todoItems[index]);
      //     },
      //   ),
      // ),
    );
  }
}

// this is creating
