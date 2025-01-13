import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/ar_bloc/ar_bloc.dart';

class ArScreen extends StatefulWidget {
  const ArScreen({super.key});

  @override
  ArScreenState createState() => ArScreenState();
}

class ArScreenState extends State<ArScreen> {
  ArCoreController? augmentedRealityCoreController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArBloc, ArState>(
      builder: (context, state) {
        if (state is ArInitial) {
          return ArCoreView(
            onArCoreViewCreated: (ArCoreController controller) {
              augmentedRealityCoreController = controller;
              context.read<ArBloc>().add(ArSphereEvent(controller));
            },
          );
        }
        if (state is ArSphere) {
          return Center(
            child: IconButton(
                onPressed: () {
                  if (augmentedRealityCoreController != null) {
                    context.read<ArBloc>().add(ArSphereEvent(augmentedRealityCoreController!));
                  } else {
                    print('augmentedRealityCoreController is null');
                  }
                },
                icon: const Icon(Icons.add)
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}