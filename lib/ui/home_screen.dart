import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soundboard'),
      ),
      body: Center(
        child: GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  playLocal('dog.mp3');
                },
                child: Image.asset(
                  'assets/images/dog.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  playLocal('cat.mp3');
                },
                child: Image.asset(
                  'assets/images/cat.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  playLocal('duck.mp3');
                },
                child: Image.asset(
                  'assets/images/duck.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  playLocal('cow.mp3');
                },
                child: Image.asset(
                  'assets/images/cow.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  playLocal(String localPath) async {
    final file = new File('${(await getTemporaryDirectory()).path}/music.mp3');
    await file.writeAsBytes(
        (await rootBundle.load('assets/sounds/${localPath}'))
            .buffer
            .asUint8List());
    final result = await audioPlayer.play(file.path, isLocal: true);
  }
}
