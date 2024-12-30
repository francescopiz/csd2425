import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:frontend/api/poi.dart';
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
  int _currentImage = 0;

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

  /*void _nextImage() {
    if (_currentImage < widget.pois[_currentPoiIndex].mediafiles.length - 1) {
      setState(() {
        _currentImage++;
      });
    }
  }

  void _previousImage() {
    if (_currentImage > 0) {
      setState(() {
        _currentImage--;
      });
    }
  }*/

  void _nextPoi() {
    if (_currentPoiIndex < widget.pois.length - 1) {
      setState(() {
        _currentPoiIndex++;
        //resetto l'indice dell'immagine
        _currentImage = 0;
        _pageController.jumpToPage(_currentPoiIndex);
      });
    }
  }

  void _previousPoi() {
    if (_currentPoiIndex > 0) {
      setState(() {
        _currentPoiIndex--;
        //resetto l'indice dell'immagine
        _currentImage = 0;
        _pageController.jumpToPage(_currentPoiIndex);
      });
    }
  }
  void playSound(){
    //AudioPlayer audioPlayer = AudioPlayer();
    //await audioPlayer.play(widget.pois[_currentPoiIndex].audioDescription);
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
                /*Positioned(
                  left: 0,
                  top: MediaQuery.of(context).size.height * 0.15 - 24,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: _previousImage,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.15 - 24,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: _nextImage,
                  ),
                ),*/
              ],
            ),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to play the audio description
                playSound();
              },
              child: const Text('Play audio description'),
            ),
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
             Card(
               child:
                Column(
                  children: [
                    ListView.builder(
                      itemCount: widget.pois[_currentPoiIndex].quiz.length,
                      itemBuilder: (context, index) {
                        return QuizWidget(
                          question: widget.pois[_currentPoiIndex].quiz[index].description,
                          answer1: widget.pois[_currentPoiIndex].quiz[index].answer1,
                          answer2: widget.pois[_currentPoiIndex].quiz[index].answer2,
                          answer3: widget.pois[_currentPoiIndex].quiz[index].answer3,
                          answer4: widget.pois[_currentPoiIndex].quiz[index].answer4,
                          correctAnswer: widget.pois[_currentPoiIndex].quiz[index].answer
                        );
                      },
                    ),
                  ],
                ),
             )
          ],
        ),
      ),
    );
  }
}
