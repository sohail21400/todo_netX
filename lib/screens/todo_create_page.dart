import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/services/firebase_service.dart';

class CreateToDoPage extends StatefulWidget {
  @override
  _CreateToDoPageState createState() => _CreateToDoPageState();
}

class _CreateToDoPageState extends State<CreateToDoPage> {
  // creating an instance of class firebase service to access it's functions
  FirebaseService _firebaseService = FirebaseService();
  // text editign controller to store the user input
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Todo",
              style: TextStyle(
                fontSize: 27,
              ),
            ),
            TextField(
              controller: controller,
            ),
            Spacer(),
            Center(
              child: RaisedButton(
                child: Text("Done"),
                onPressed: () async {
                  showDialog(
                    context: context,
                    child: Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                  await _firebaseService.createTodo(Todo(
                    controller.text,
                    false,
                  ));
                  // to close the dialog (loading)
                  Navigator.pop(context);
                  // to go to previous page
                  Navigator.pop(context);
                  print("Button pressed");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
