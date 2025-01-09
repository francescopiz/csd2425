part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

class SelectedAnswer extends QuizEvent {
  final int correctIndex;
  final int answerIndex;

  SelectedAnswer(this.correctIndex, this.answerIndex);
}


