part of 'quiz_bloc.dart';

@immutable
sealed class QuizState {
  final int quizId;
  QuizState(this.quizId);
}

final class QuizInitial extends QuizState {
  QuizInitial(super.quizId);
}

final class CorrectAnswer extends QuizState {
  final Color color = Colors.lightGreen;
  CorrectAnswer(super.quizId);
}

final class WrongAnswer extends QuizState {
  final Color color = Colors.redAccent;
  WrongAnswer(super.quizId);
}
