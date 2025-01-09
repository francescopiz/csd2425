part of 'quiz_bloc.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}


final class CorrectAnswer extends QuizState {
  final Color color = Colors.green;
  CorrectAnswer();
}
final class WrongAnswer extends QuizState {

}
