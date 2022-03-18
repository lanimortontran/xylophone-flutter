import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  List<Color> keyColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.green[900],
    Colors.blue[800],
    Colors.deepPurple,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(keyColors.length, buildKey),
          ),
        ),
      ),
    );
  }

  Widget buildKey(int key) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: keyColors[key],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
        onPressed: () => playSound(key + 1),
        child: null,
      ),
    );
  }

  void playSound(int keyNumber) {
    AudioCache audioPlayer = AudioCache();
    audioPlayer.play('note$keyNumber.wav');
  }
}
