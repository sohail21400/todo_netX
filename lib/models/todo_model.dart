// data class, holds the data of a todo item
import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String text;
  bool isDone;

  //constructor to create an instance (object) of this class
  Todo(this.text, this.isDone);

  // this function returns a Todo from a document snapshot
  Todo.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    // it just gives the data form a document
    var data = documentSnapshot.data;
    this.text = data["todoName"];
    this.isDone = data["isDone"];
  }
}
