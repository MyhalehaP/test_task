import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/math/color_randomizer.dart';


class ScreenColor extends StatefulWidget {
  @override
  _ScreenColorState createState() => _ScreenColorState();
}

class _ScreenColorState extends State<ScreenColor> {

  final player = AudioPlayer();

  List<int> colors = [255, 0, 170, 200];
  bool mode_on = false, can_tap = true;

  void changeColor() {
    setState(() {
      colors = ColorRandomizer().getRandomARGB();
    });
  }

  /// Checks if the container was tapped and triggers function for color change.
  ///
  /// Additionally contains 'special mode' button.
  /// 'Special mode' [timingColors] enables timing for [changeColor].
  /// After enabling the mode, [playMusic] is being triggered.
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          child: Container(
            color: Color.fromARGB(colors[0], colors[1], colors[2], colors[3]),
          ),
          onTap: mode_on ? () => null : () => changeColor(),
        ),

        Container(
          child: Align(
            alignment: Alignment.bottomCenter,

            child: FlatButton(
                onPressed: can_tap ? () => timingColors(): () => null,
                child: mode_on ? Text(
                    "Stop",
                    style: TextStyle(
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(color: Colors.blue, offset: Offset.fromDirection(1.0))
                    ])) : Text(
                    "Special Mode",
                    style: TextStyle(
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(color: Colors.blue, offset: Offset.fromDirection(1.0))
                        ]))),
          ),

          margin: EdgeInsets.all(35),
        )
      ],
    );
  }

  /// Sets the timer for [changeColor]. Triggers [playMusic]
  void timingColors() {
    preventDoubleTap();
    setState(() {
      mode_on = !mode_on;
    });

    playMusic();

    Timer.periodic(Duration(milliseconds: 531), (timer) {
      if(mode_on)changeColor();else timer.cancel();
    });
  }

  /// Method prevents overloading of the button.
  ///
  /// Insane 'special mode' button tapping previously caused
  /// overloading of the timer, thus making a periodical offset
  void preventDoubleTap(){
    setState(() {
      can_tap = false;
    });

    Timer(Duration(milliseconds: 500),() => this.setState(() {
      can_tap = true;
    }));
  }

  playMusic() async {
    if(mode_on) await player.play("https://www.mboxdrive.com/test_song_rick_astley.mp3");
    else player.stop();
  }

}