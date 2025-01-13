part of 'quiz_bloc.dart';

@immutable
sealed class QuizState {
  final int quizId;
  const QuizState(this.quizId);
}

final class QuizInitial extends QuizState {
  const QuizInitial(super.quizId);
}

final class CorrectAnswer extends QuizState {
  final int? selectedAnswer;
  final Color color = Colors.lightGreen;
  CorrectAnswer(super.quizId, this.selectedAnswer);
}

final class WrongAnswer extends QuizState {
  final int? selectedAnswer;
  final Color color = Colors.redAccent;
  WrongAnswer(super.quizId, this.selectedAnswer);
}