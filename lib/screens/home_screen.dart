import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/components/greeting_text.dart';
import 'package:test_task/components/screen_color.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          ScreenColor(),
          GreetingText(),
        ]),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
