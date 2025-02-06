part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

class SelectedAnswer extends QuizEvent {
  final int quizId;
  final int correctIndex;
  final int answerIndex;
  int? value;

  SelectedAnswer(this.quizId,this.correctIndex, this.answerIndex, this.value);
}
class QuizSelected extends QuizEvent {
  final int quizId;

  QuizSelected(this.quizId);
}


