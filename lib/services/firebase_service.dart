import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/todo_model.dart';

class FirebaseService {
  // this hold all the database functions
  Firestore _firestore = Firestore.instance;

  // to create a new todo
  createTodo(Todo todo) async {
    await _firestore
        .collection("users")
        .document("demo")
        .collection("user-data")
        .document()
        .setData({
      "todoName": todo.text,
      "isDone": todo.isDone,
    });
    print("upload done");
  }

  // delete todo
  deleteTodo() {}

  checkOrUncheckTodo() {}

  // fetch all todo from the database
  getAllTodo() {}
}
