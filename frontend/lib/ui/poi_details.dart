import 'package:flutter/material.dart';

class PoiDetails extends StatefulWidget {
  const PoiDetails({super.key});

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
        title: const Text('Dettagli POI'),
      ),
      body: const Center(
        child: Text('Dettagli POI'),
      ),
    );
  }
}