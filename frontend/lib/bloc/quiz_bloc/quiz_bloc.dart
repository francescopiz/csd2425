import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';

part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {

  QuizBloc() : super(QuizInitial()) {
    on<SelectedAnswer>((event, emit) async {
       if(event.answerIndex==event.correctIndex) {
         emit(CorrectAnswer());
       } else {
         emit(WrongAnswer());
       }
    });
  }
}