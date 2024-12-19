import 'package:flutter/material.dart';
import 'package:frontend/services/services.dart';

class DebugScreen extends StatefulWidget {
  const DebugScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DebugScreenState();
  }
}

class _DebugScreenState extends State<DebugScreen> {
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug screen'),
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
                  }
                },
                child: const Text('Save URL'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
