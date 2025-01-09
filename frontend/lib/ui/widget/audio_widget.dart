import 'dart:async';
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

class _AudioWidgetState extends State<AudioWidget>
    with SingleTickerProviderStateMixin {
  final player = AudioPlayer();
  bool _isDragging = false;
  late AnimationController _animationController;
  double _currentSliderValue = 0.0;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller for smooth slider movement
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    // Decode and set audio source
    final audioBytes = base64Decode(widget.audio!);
    final audioSource = AudioSource.uri(
      Uri.dataFromBytes(audioBytes, mimeType: 'audio/mpeg'),
    );
    player.setAudioSource(audioSource);

    // Listen to player state changes
    player.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {});
        if (player.playing) {
          _animationController.repeat();
        } else {
          _animationController.stop();
        }
      }
    });

    // Smooth position updates using animation
    _animationController.addListener(() {
      if (!_isDragging && mounted && player.playing) {
        setState(() {
          _currentSliderValue = player.position.inMilliseconds.toDouble();
        });
      }
    });

    // Listen to position for end of track
    player.positionStream.listen((position) {
      if (position >= (player.duration ?? Duration.zero)) {
        _resetPlayer();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    player.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    return [
      duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
      duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
    ].join(':');
  }

  Future<void> _resetPlayer() async {
    await player.seek(Duration.zero);
    await player.pause();
    _animationController.stop();
    setState(() {
      _currentSliderValue = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isPlaying = player.playing;
    final duration = player.duration ?? Duration.zero;

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
                  _animationController.stop();
                } else {
                  await player.play();
                  _animationController.repeat();
                }
              },
            ),
            IconButton(
              icon: Icon(
                Icons.stop,
                size: 50,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: _resetPlayer,
            ),
          ],
        ),
        Column(
          children: [
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 4.0,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 6.0,
                ),
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 14.0,
                ),
                activeTrackColor: Theme.of(context).primaryColor,
                inactiveTrackColor: Colors.grey[300],
                thumbColor: Theme.of(context).primaryColor,
                overlayColor: Theme.of(context).primaryColor.withOpacity(0.3),
              ),
              child: Slider(
                value: _currentSliderValue.clamp(
                    0, duration.inMilliseconds.toDouble()),
                min: 0,
                max: duration.inMilliseconds.toDouble(),
                onChangeStart: (value) {
                  _isDragging = true;
                  if (isPlaying) {
                    _animationController.stop();
                  }
                },
                onChanged: (value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
                onChangeEnd: (value) async {
                  _isDragging = false;
                  await player.seek(Duration(milliseconds: value.toInt()));
                  if (isPlaying) {
                    _animationController.repeat();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(
                        Duration(milliseconds: _currentSliderValue.toInt())),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    _formatDuration(duration),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
