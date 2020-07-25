import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/screens/todo_create_page.dart';
import 'package:todo/services/firebase_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseService _firebaseService = FirebaseService();

  // // this list holds the data of todos
  // List<Todo> todoItems = [
  //   Todo("remind me", false),
  //   Todo("remind me to buy milk", false),
  //   Todo("take bath", true),
  //   Todo("remind me", false),
  //   Todo("remind me", false),
  //   Todo("remind me", false),
  // ];

  // --------------------------------------------------------------
  // this function converts the todo data to a todo widget
  Widget todoItemWidget(Todo todoObject) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
            context: context,
            child: AlertDialog(
              title: Text("Do you want to delete?"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      child: Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                    // deletes the todo
                    await _firebaseService.deleteTodo(todoObject);
                    Navigator.pop(context);
                    Navigator.pop(context);

                    // updates the UI
                    setState(() {});
                  },
                  child: Text("Yes"),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No"),
                ),
              ],
            ));
      },
      child: Container(
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
              onChanged: (value) async {
                showDialog(
                  context: context,
                  child: Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
                // here we need to call checkoruncheck funciton'
                await _firebaseService.checkOrUncheckTodo(todoObject);
                print(value);
                // this line updates the UI/ Page
                setState(() {});
                Navigator.pop(context);
              },
              value: todoObject.isDone,
            )
          ],
        ),
      ),
    );
  }
  // --------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateToDoPage()));
          print("hello");
        },
      ),
      body: FutureBuilder(
        future: _firebaseService.getAllTodo(),
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          var todoList = snapshot.data;

          if (todoList == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return todoItemWidget(todoList[index]);
              },
            );
          }
        },
      ),
    );
  }
}
