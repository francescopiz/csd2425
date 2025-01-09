part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

class SelectedAnswer extends QuizEvent {
  final int quizId;
  final int correctIndex;
  final int answerIndex;

  SelectedAnswer(this.quizId,this.correctIndex, this.answerIndex);
}


