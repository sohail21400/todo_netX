import 'package:flutter/material.dart';

class CreateToDoPage extends StatefulWidget {
  @override
  _CreateToDoPageState createState() => _CreateToDoPageState();
}

class _CreateToDoPageState extends State<CreateToDoPage> {
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
            TextField(),
            Spacer(),
            Center(
              child: RaisedButton(
                child: Text("Done"),
                onPressed: () {
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
