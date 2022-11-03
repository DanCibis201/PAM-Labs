import 'dart:io';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Welcome to Flutter';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp._title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Second Lab Presentation - V2'),
        ),
        body: Center(
          child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your sentence',
              ),
              controller: _controller,
              onSubmitted: (String value) async {

                String letter = "A";
                int wordCount = 0; //verificam daca a fost check-uit litera A
                int word = 0;

                for (int i = 0; i < value.length; i++) { //loop ca sa iteram asupra stringului
                  if (wordCount % 2 == 0 && value[i] == letter) {
                    word += 1;
                    wordCount = 1; // setez impar, ca sa nu mai verific cuvintul curent
                  } else if ( value[i] == " "){
                    wordCount = 0; // aici e par, incat sa stiu ca treb de verificat cuv. curent
                  }
                  else {
                    print(word);
                  }
                }
                await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Results!'),
                        content: Text(
                            'You typed "$value", with $word words with "A".'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          )
                        ],
                      );
                    });
              }),
        ),
      ),
    );
  }
}