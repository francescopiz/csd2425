import 'package:flutter/material.dart';

class PoiDetails extends StatefulWidget {
  final String title;
  final String description;

  const PoiDetails({super.key, required this.title, required this.description});

  @override
  State<StatefulWidget> createState() {
    return _PoiDetailsState();
  }
}

class _PoiDetailsState extends State<PoiDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // inserisci immagine da link
              Image.network('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg5.juzaphoto.com%2F001%2Fshared_files%2Fuploads%2F3375368_l.jpg&f=1&nofb=1&ipt=36061bb3669ec70727835fdd6cd79a999018eb38f5a4d02084144a7cebe3b933&ipo=images'),

              Card(
                  child: Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}