import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/services/services.dart';

import '../bloc/tour_bloc/tour_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impostazioni',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _urlController,
                decoration: const InputDecoration(labelText: 'url'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final url = _urlController.text;
                  if (url.isNotEmpty) {
                    Services.of(context).tourService.url = url;
                    BlocProvider.of<TourBloc>(context).add(LoadTours());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Save URL'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
