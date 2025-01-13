import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ArTest extends StatefulWidget {
  const ArTest({super.key});

  @override
  ArTestState createState() => ArTestState();
}

class ArTestState extends State<ArTest> {
  ArCoreController? augmentedRealityCoreController;
  String shape = '';
  bool isScanCompleted = false;

  @override
  void dispose() {
    augmentedRealityCoreController?.dispose();
    super.dispose();
  }

  void augmentedRealityViewCreated(ArCoreController controller) {
    augmentedRealityCoreController = controller;
    if (shape.isNotEmpty) {
      displayShape(augmentedRealityCoreController!, shape);
    }
  }

  Future<void> displayShape(ArCoreController controller, String shapeType) async {
    try {
      final ByteData textureBytes = await rootBundle.load("assets/earth_map.jpg");
      final materials = ArCoreMaterial(
        color: Colors.blue,
        textureBytes: textureBytes.buffer.asUint8List(),
      );

      ArCoreNode node;
      switch (shapeType) {
        case 'sphere':
          final sphere = ArCoreSphere(materials: [materials]);
          node = ArCoreNode(
            shape: sphere,
            position: vector64.Vector3(0, 0, -1.5),
          );
          break;
        case 'cube':
          final cube = ArCoreCube(
            materials: [materials],
            size: vector64.Vector3(0.2, 0.2, 0.2),
          );
          node = ArCoreNode(
            shape: cube,
            position: vector64.Vector3(0.5, 0, -1.5),
          );
          break;
        default:
          return;
      }

      controller.addArCoreNode(node);
    } catch (e) {
      debugPrint("Errore nel caricamento della shape: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Test'),
      ),
      body: isScanCompleted
          ? ArCoreView(
        onArCoreViewCreated: augmentedRealityViewCreated,
      )
          : MobileScanner(
        onDetect: (barcodeCapture) {
          final qrValue = barcodeCapture.barcodes.first.rawValue;
          if (qrValue != null && !isScanCompleted) {
            setState(() {
              shape = qrValue;
              isScanCompleted = true;
            });
          }
        },
      ),
    );
  }
}
