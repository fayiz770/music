import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const Music());
}

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  Expanded buildKey(
      {required Color color, required String text, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: () {
          setState(
            () {
              final player = AudioPlayer();
              player.play(
                AssetSource('note$soundNumber.wav'),
              );
            },
          );
        },
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 60, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(color: Colors.red, text: '1', soundNumber: 1),
            buildKey(color: Colors.orange, text: '2', soundNumber: 2),
            buildKey(color: Colors.yellow, text: '3', soundNumber: 3),
            buildKey(color: Colors.green, text: '4', soundNumber: 4),
            buildKey(color: Colors.blue, text: '5', soundNumber: 5),
            buildKey(color: Colors.pink, text: '6', soundNumber: 6),
            buildKey(color: Colors.purple, text: '7', soundNumber: 7),
          ],
        ),
      ),
    );
  }
}
