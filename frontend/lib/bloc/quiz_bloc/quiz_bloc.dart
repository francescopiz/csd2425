import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';

part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, Map<int, QuizState>> {

  QuizBloc() : super({}) {
    on<SelectedAnswer>((event, emit) async {
       //if(event.answerIndex==event.correctIndex) {
      //  emit(CorrectAnswer());
      //} else {
      //   emit(WrongAnswer());
      //}
       //final currentState = state[event.quizId] ?? QuizInitial(event.quizId);
       if (event.answerIndex == event.correctIndex) {
         emit({...state, event.quizId: CorrectAnswer(event.quizId)});
       } else {
         emit({...state, event.quizId: WrongAnswer(event.quizId)});
       }
    });
  }
}