import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pvs/src/service/data_handler.dart';

part 'quiz_result_event.dart';
part 'quiz_result_state.dart';

class QuizResultBloc extends Bloc<QuizResultEvent, QuizResultState> {
  QuizResultBloc() : super(QuizResultInitial()) {
    on<QuizResultEventGet>(_onGet);
  }

  FutureOr<void> _onGet(QuizResultEventGet event, Emitter<QuizResultState> emit) async {
    await DataHandler.getRsult(event.id, event.lesson).then((value) {
      print(value);
      if(value == 'nope') {
        emit(QuizResultInitial());
      } else if (value.length == 1) {
        emit(QuizResultInitial());
      } else {
        emit(QuizResultStateDone(result: value));
      }
    });
  }
}
