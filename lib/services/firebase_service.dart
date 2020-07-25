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

  deleteTodo(Todo todo) async {
    await _firestore
        .collection("users")
        .document("demo")
        .collection("user-data")
        .document(todo.documentID)
        .delete();
  }

  checkOrUncheckTodo(Todo todo) async {
    DocumentReference todoDocumentReference = _firestore
        .collection("users")
        .document("demo")
        .collection("user-data")
        .document(todo.documentID);

    await todoDocumentReference.updateData({
      "isDone": !todo.isDone,
    });
  }

  // returns data in the form we need
  List<Todo> todoFromQuerysnapshot(QuerySnapshot snapshot) {
    List<Todo> todoList = [];

    // snapshot.documents gives a list of document snapshot
    for (var i in snapshot.documents) {
      Todo aTodo = Todo.fromDocumentSnapshot(i);
      todoList.add(aTodo);
    }

    return todoList;
  }

  // fetch all todo from the database
  Future<List<Todo>> getAllTodo() async {
    QuerySnapshot todoSnapshot = await _firestore
        .collection("users")
        .document("demo")
        .collection("user-data")
        .getDocuments();

    List<Todo> todoList = todoFromQuerysnapshot(todoSnapshot);
    return todoList;
  }
}
