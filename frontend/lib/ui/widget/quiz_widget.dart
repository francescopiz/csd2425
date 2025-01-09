import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/quiz_bloc/quiz_bloc.dart';

class QuizWidget extends StatefulWidget {
  final int quizId;
  final String question;
  final String answer1;
  final String answer2;
  final String? answer3;
  final String? answer4;
  final int correctAnswer;

  const QuizWidget({
    super.key,
    required this.quizId,
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
      blastDirection: 45,
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
            return BlocBuilder<QuizBloc, Map<int, QuizState>>(
              builder: (BuildContext context, state) {
                final quizState = state[widget.quizId] ?? QuizInitial(widget.quizId);
                return SizedBox(
                  child: RadioListTile<int>(
                    title: Text(answer),
                    value: answers.indexOf(answer),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    selected: selectedAnswer == answers.indexOf(answer),
                    selectedTileColor: quizState is CorrectAnswer
                        ? quizState.color
                        : quizState is WrongAnswer
                        ? quizState.color
                        : Colors.transparent,
                    groupValue: selectedAnswer,
                    onChanged: (int? value) {
                      context.read<QuizBloc>().add(SelectedAnswer(widget.quizId, widget.correctAnswer, answers.indexOf(answer)));
                      setState(() {
                        selectedAnswer = value!;
                      });
                      if (quizState is CorrectAnswer) {
                        controller.play();
                      } else {
                        controller.stop();
                      }
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
