import 'package:flutter/material.dart';

class ArCamera extends StatefulWidget {
  const ArCamera({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ArCameraState();
  }
}

class _ArCameraState extends State<ArCamera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotocamera AR'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text('inquadra il qrcode per vedere fantasticherie'),
        ),
      ),
    );
  }
}