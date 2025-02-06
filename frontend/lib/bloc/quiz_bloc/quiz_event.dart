part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

class SelectedAnswer extends QuizEvent {
  final int quizId;
  final int correctIndex;
  final int answerIndex;

  SelectedAnswer(this.quizId,this.correctIndex, this.answerIndex);
}
class QuizSelected extends QuizEvent {
  final int quizId;

  QuizSelected(this.quizId);
}

