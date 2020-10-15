import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GreetingText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          "Hey there",
          style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(color: Colors.blue, offset: Offset.fromDirection(1.0))
              ]),
        ));
  }
}
