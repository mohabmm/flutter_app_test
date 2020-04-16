import 'package:flutter/material.dart';
import 'package:flutterapptest/provider.dart';
import 'package:provider/provider.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = Provider.of<TextProvider>(context);

    print(text.getTextData);

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Column(
        children: [
          new TextField(
            decoration: InputDecoration(
              hintText: '${text.getTextData}',
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          ),
        ],
      ),
    );
  }
}
