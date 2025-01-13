import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ar_event.dart';
part 'ar_state.dart';

class ArBloc extends Bloc<ArEvent, ArState> {
  ArBloc() : super(ArInitial()) {
    on<ArSphereEvent>((event, emit) {
      augmentedRealityCoreController = event.controller;
      emit(ArSphere(augmentedRealityCoreController!));
    });
  }
}
ArCoreController? augmentedRealityCoreController;

displayEarthMapSphere(ArCoreController controller) async {
  final ByteData earthTextureBytes =
  await rootBundle.load("assets/earth_map.jpg");
  final materials = ArCoreMaterial(
    //color: Colors.blue,
    textureBytes: earthTextureBytes.buffer.asUint8List(),
  );
  final sphere = ArCoreSphere(
    materials: [materials],
  );
  final cube = ArCoreCube(
    materials: [materials],
    size: vector64.Vector3(0.2, 0.2, 0.2),
  );
  final node = ArCoreNode(
    shape: sphere,
    position: vector64.Vector3(0, 0, -1.5),
  );
  return augmentedRealityCoreController!.addArCoreNode(node);
}