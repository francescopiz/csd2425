import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ArCamera extends StatefulWidget {
  const ArCamera({super.key});

  @override
  State<ArCamera> createState() => _ArCameraState();
}

class _ArCameraState extends State<ArCamera> {
  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotocamera AR',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: MobileScanner(
          onDetect: (barcodeCapture) {
            if (!isScanCompleted) {
              //String code = barcodeCapture.barcodes.first.rawValue ?? '---';
              isScanCompleted = true;
            }
          },
        ),
      ),
    );
  }
}