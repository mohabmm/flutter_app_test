// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapptest/screenTwo.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

/// This is an example of a counter application using `provider` + [ChangeNotifier].
///
/// It builds a typical `+` button, with a twist: the texts using the counter
/// are built using the localization framework.
///
/// This shows how to bind our custom [ChangeNotifier] to things like [LocalizationsDelegate].

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TextProvider()),
      ],
      child: Consumer<TextProvider>(
        builder: (context, counter, _) {
          return MaterialApp(
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("test")),
      body: Center(child: CounterLabel()),
      floatingActionButton: IncrementCounterButton(),
    );
  }
}

class IncrementCounterButton extends StatelessWidget {
  IncrementCounterButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondRoute()),
        );
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class CounterLabel extends StatefulWidget {
  @override
  _CounterLabelState createState() => _CounterLabelState();
}

class _CounterLabelState extends State<CounterLabel> {
  final myController = TextEditingController();
//
//  @override
//  void dispose() {
//    // Clean up the controller when the widget is disposed.
//    myController.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<TextProvider>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'You have pushed the button this many times:',
        ),
        Text(
          '${text.getTextData}',
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.display1,
        ),
        TextField(
          controller: myController,
          onSubmitted: (text) {
            Provider.of<TextProvider>(context, listen: false)
                .setStringValue(text);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter a search term',
          ),
        ),
      ],
    );
  }
}
