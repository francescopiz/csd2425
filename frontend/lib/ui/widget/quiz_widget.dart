import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/quiz_bloc/quiz_bloc.dart';

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
    required this.correctAnswer
  });

  @override
  State<StatefulWidget> createState() {
    return _QuizWidgetState();
  }
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedAnswer=-1;
  ConfettiController controller = ConfettiController(duration: const Duration(seconds: 1));
  @override
  Widget build(BuildContext context) {
    List<String> answers = [widget.answer1, widget.answer2];
    if (widget.answer3 != null) answers.add(widget.answer3!);
    if (widget.answer4 != null) answers.add(widget.answer4!);
    return ConfettiWidget(
      confettiController: controller,
      blastDirection: -3.4/2,
      emissionFrequency: 0.05,
      numberOfParticles: 20,
      maxBlastForce: 100,
      minBlastForce: 80,
      gravity: 0.1,
      child: Column(
        children: [
          Text(
            widget.question,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          ...answers.map((answer) {
            return BlocBuilder<QuizBloc, QuizState>(
              builder: (BuildContext context, state) {
                return SizedBox(
                  child:
                  RadioListTile<int>(
                    title: Text(answer),
                    value: answers.indexOf(answer),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    selected: selectedAnswer == answers.indexOf(answer),
                    selectedTileColor: state is CorrectAnswer ? state.color : state is WrongAnswer ? Colors.red: Colors.black,
                    groupValue: selectedAnswer,
                    onChanged: (int? value) {
                      context.read<QuizBloc>().add(SelectedAnswer(widget.correctAnswer, answers.indexOf(answer)));
                      selectedAnswer = value!;
                      state is CorrectAnswer ? controller.play() : controller.stop();
                    },
                  ),
                );
              },
            );
          }
          ),
        ],
      ),
    );
  }
}
