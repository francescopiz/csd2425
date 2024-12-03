import 'package:flutter/material.dart';
import 'package:frontend/ui/widget/simple_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleziona il tuo tour'),
      ),
      body: const SimpleCard(title: 'title'),
    );
  }
}