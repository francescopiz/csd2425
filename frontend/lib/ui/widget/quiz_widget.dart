import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final String question;
  final String answer1;
  final String answer2;
  final String? answer3;
  final String? answer4;
  final int correctAnswer;

  const QuizWidget({
    super.key,
    required this.question,
    required this.answer1,
    required this.answer2,
    this.answer3,
    this.answer4,
    required this.correctAnswer,
  });

  @override
  State<StatefulWidget> createState() {
    return _QuizWidgetState();
  }
}

class _QuizWidgetState extends State<QuizWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> answers = [widget.answer1, widget.answer2];
    if (widget.answer3 != null) answers.add(widget.answer3!);
    if (widget.answer4 != null) answers.add(widget.answer4!);
    return Column(
      children: [
        Text(
          widget.question,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: answers.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(answers[index]),
                onTap: () {
                  // Handle answer tap
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
