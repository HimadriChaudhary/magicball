import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MagicBall(),
  ));
}

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballNum = 1;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ask a Question',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (textController.text == '') {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Please type your question..!'),
                      );
                    });
              } else {
                setState(() {
                  ballNum = Random().nextInt(5) + 1;
                  textController.text = '';
                });
              }
            },
            child: Image.asset('images/ball$ballNum.png'),
          )
        ]),
      ),
    );
  }
}
