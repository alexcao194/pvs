import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pvs/src/service/data_handler.dart';

part 'lessons_event.dart';
part 'lessons_state.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  LessonsBloc() : super(LessonsInitial()) {
    on<LessonsEventGet>(_onGet);
  }

  FutureOr<void> _onGet(LessonsEventGet event, Emitter<LessonsState> emit) async {
    await DataHandler.getLessons().then((value) {
      List<String> lt = [];
      for(int i = 0; i < value['totalLesson']; i++) {
        lt.add(value['lessons'][i]);
      }
      emit(LessonsStateGetSuccessful(
          lessons: lt,
          currentLesson: value['currentLesson'],
          totalLesson: value['totalLesson']
      ));
    }).timeout(const Duration(milliseconds: 2000)).onError((error, stackTrace) {
      print(error);
      emit(LessonsStateGetFail());
    });
  }
}
