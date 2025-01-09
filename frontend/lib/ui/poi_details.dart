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

  void _changePoi(int newIndex) {
    setState(() {
      _currentPoiIndex = newIndex;
      _pageController.jumpToPage(newIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pois[_currentPoiIndex].name,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.pois[_currentPoiIndex].mediafiles.length,
                itemBuilder: (context, index) {
                  return Image.memory(
                    base64Decode(
                        widget.pois[_currentPoiIndex].mediafiles[index].data),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            AudioWidget(audio: widget.pois[_currentPoiIndex].audioDescription),
            const SizedBox(height: 20),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Descrizione:',
                            style: TextStyle(
                                fontSize: 14.0, fontStyle: FontStyle.italic),
                          ),
                          Text(
                            widget.pois[_currentPoiIndex].description,
                            style: const TextStyle(
                                fontSize: 16.0, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            ...widget.pois[_currentPoiIndex].quiz.map((quiz) {
              return QuizWidget(
                quizId: quiz.id,
                question: quiz.description,
                answer1: quiz.answer1,
                answer2: quiz.answer2,
                answer3: quiz.answer3,
                answer4: quiz.answer4,
                correctAnswer: quiz.correctAnswer,
              );
            }),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _currentPoiIndex > 0
                        ? () => _changePoi(_currentPoiIndex - 1)
                        : null,
                    child: const Text('Previous POI'),
                  ),
                  ElevatedButton(
                    onPressed: _currentPoiIndex < widget.pois.length - 1
                        ? () => _changePoi(_currentPoiIndex + 1)
                        : null,
                    child: const Text('Next POI'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
