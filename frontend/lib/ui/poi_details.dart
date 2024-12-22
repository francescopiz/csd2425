import 'package:flutter/material.dart';
import 'package:frontend/api/Poi.dart';

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

  void _nextImage() {
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
  }

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
                          widget.pois[_currentPoiIndex].mediafiles[index].data);
                    },
                  ),
                ),
                Positioned(
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
                ),
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
              //TODO creare domande dinamiche
              child: Column(
                children: [
                  Text(
                    'Domanda',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    title: Text('Risposta 1'),
                    leading: Radio(
                      value: 1,
                      groupValue: 0,
                      onChanged: (value) {},
                    ),
                  ),
                  ListTile(
                    title: Text('Risposta 2'),
                    leading: Radio(
                      value: 1,
                      groupValue: 0,
                      onChanged: (value) {},
                    ),
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
