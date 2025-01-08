import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioWidget extends StatefulWidget {
  final String? audio;

  const AudioWidget({
    super.key,
    required this.audio,
  });

  @override
  State<StatefulWidget> createState() {
    return _AudioWidgetState();
  }
}

class _AudioWidgetState extends State<AudioWidget> {
  final player = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    final audioBytes = base64Decode(widget.audio!);
    final audioSource =
        AudioSource.uri(Uri.dataFromBytes(audioBytes, mimeType: 'audio/mpeg'));
    player.setAudioSource(audioSource);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 50,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () async {
                if (isPlaying) {
                  await player.pause();
                } else {
                  await player.play();
                }
                setState(() {
                  isPlaying = !isPlaying;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.stop,
                  size: 50, color: Theme.of(context).primaryColor),
              onPressed: () async {
                await player.stop();
                setState(() {
                  isPlaying = false;
                });
              },
            ),
          ],
        ),
        Slider(
          value: player.position.inSeconds.toDouble(),
          min: 0,
          max: player.duration?.inSeconds.toDouble() ?? 0,
          onChanged: (value) async {
            await player.seek(Duration(seconds: value.toInt()));
          },
        ),
      ],
    );
  }
}

//final duration = await player.setUrl(           // Load a URL
//'https://foo.com/bar.mp3');                 // Schemes: (https: | file: | asset: )
//player.play();                                  // Play without waiting for completion
//await player.play();                            // Play while waiting for completion
//await player.pause();                           // Pause but remain ready to play
//await player.seek(Duration(seconds: 10));       // Jump to the 10 second position
//await player.setSpeed(2.0);                     // Twice as fast
//await player.setVolume(0.5);                    // Half as loud
//await player.stop();                            // Stop and free resources
