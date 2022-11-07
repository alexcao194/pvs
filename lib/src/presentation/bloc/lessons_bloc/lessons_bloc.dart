import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/service/data_handler.dart';

import '../../screen/home_screen/pages/exercise_page/quiz_screen/bloc/quiz_result_bloc/quiz_result_bloc.dart';

part 'lessons_event.dart';
part 'lessons_state.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  LessonsBloc() : super(LessonsInitial()) {
    on<LessonsEventGet>(_onGet);
    on<LessonsEventChange>(_onChange);
  }

  FutureOr<void> _onGet(LessonsEventGet event, Emitter<LessonsState> emit) async {
    await DataHandler.getLessons().then((value) {
      BlocProvider.of<QuizResultBloc>(event.context).add(QuizResultEventGet(id: event.id, lesson: 'lesson_${value['currentLesson']}'));
      List<String> lt = [];
      for(int i = 0; i < value['totalLesson']; i++) {
        lt.add(value['lessons'][i]);
      }
      emit(LessonsStateGetSuccessful(
          lessons: lt,
          currentLesson: value['currentLesson'],
          totalLesson: value['totalLesson'],
          pickedLesson: value['currentLesson']
      ));
    }).timeout(const Duration(milliseconds: 2000)).onError((error, stackTrace) {
      emit(LessonsStateGetFail());
    });
  }

  FutureOr<void> _onChange(LessonsEventChange event, Emitter<LessonsState> emit) {
    BlocProvider.of<QuizResultBloc>(event.context).add(QuizResultEventGet(id: event.id, lesson: 'lesson_${event.pickedLesson}'));
    emit(LessonsStateGetSuccessful(
        lessons: event.state.lessons,
        currentLesson: event.state.currentLesson,
        totalLesson: event.state.totalLesson,
        pickedLesson: event.pickedLesson
    )
    );
  }
}
