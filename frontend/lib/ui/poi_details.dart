import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/api/poi.dart';
import 'package:frontend/ui/widget/audio_widget.dart';
import 'package:frontend/ui/widget/quiz_widget.dart';

class PoiDetails extends StatefulWidget {
  final List<Poi> pois;
  final int index;

  const PoiDetails({super.key, required this.pois, required this.index});

  @override
  State<StatefulWidget> createState() => _PoiDetailsState();
}

class _PoiDetailsState extends State<PoiDetails> {
  late PageController _pageController;
  late int _currentPoiIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentPoiIndex = widget.index;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPoi() {
    if (_currentPoiIndex < widget.pois.length - 1) {
      setState(() {
        _currentPoiIndex++;
        _pageController.jumpToPage(_currentPoiIndex);
      });
    }
  }

  void _previousPoi() {
    if (_currentPoiIndex > 0) {
      setState(() {
        _currentPoiIndex--;
        _pageController.jumpToPage(_currentPoiIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pois[_currentPoiIndex].name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.pois[_currentPoiIndex].mediafiles.length,
                    itemBuilder: (context, index) {
                      return Image.memory(
                        base64Decode(widget
                            .pois[_currentPoiIndex].mediafiles[index].data),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            AudioWidget(audio: widget.pois[_currentPoiIndex].audioDescription),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.pois[_currentPoiIndex].description,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...widget.pois[_currentPoiIndex].quiz.map((quiz) {
              return QuizWidget(
                question: quiz.description,
                answer1: quiz.answer1,
                answer2: quiz.answer2,
                answer3: quiz.answer3,
                answer4: quiz.answer4,
                correctAnswer: quiz.correctAnswer,
              );
            }),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _previousPoi,
                  child: const Text('Previous POI'),
                ),
                ElevatedButton(
                  onPressed: _nextPoi,
                  child: const Text('Next POI'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
