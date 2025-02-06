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

  Future<void> displayShape(
      ArCoreController controller, String shapeType) async {
    try {
      ArCoreNode node;

      // In base al valore di "shapeType" carichiamo il file di immagine appropriato
      if (shapeType == 'quadro') {
        // Carica un'immagine locale (modifica il path in base alle tue risorse)
        final ByteData textureBytes = await rootBundle.load("assets/quadro.jpg");
        final material = ArCoreMaterial(
          color: Colors.black,
          textureBytes: textureBytes.buffer.asUint8List(),
        );
        final imagePlane = ArCoreCube(
          materials: [material],
          size: vector64.Vector3(
              1, 1, 0.1),
        );
        node = ArCoreNode(
          shape: imagePlane,
          position: vector64.Vector3(0, 0, -2),
        );
      } else if (shapeType == 'rodolfo') {
        final ByteData textureBytes =
            await rootBundle.load("assets/rodolfo.jpg");
        final material = ArCoreMaterial(
          color: Colors.blue,
          textureBytes: textureBytes.buffer.asUint8List(),
        );
        final imagePlane = ArCoreCube(
          materials: [material],
          size: vector64.Vector3(
              1, 1, 0.1),
        );        node = ArCoreNode(
          shape: imagePlane,
          position: vector64.Vector3(0, 0, -1.5),
        );
      } else if (shapeType == 'cube') {
        final ByteData textureBytes = await rootBundle.load("assets/moon.jpg");
        final material = ArCoreMaterial(
          color: Colors.black,
          textureBytes: textureBytes.buffer.asUint8List(),
        );
        final cube = ArCoreCube(
          materials: [material],
          size: vector64.Vector3(0.2, 0.2, 0.2),
        );
        node = ArCoreNode(
          shape: cube,
          position: vector64.Vector3(0.5, 0, -1.5),
        );
      } else {
        // Se il valore non corrisponde a nessuna opzione, non fare nulla
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
        title: const Text(
          'FotocameraAR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
          textAlign: TextAlign.center,
        ),
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
