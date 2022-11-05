import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pvs/src/service/data_handler.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<TestEventGet>(_onGet);
  }

  FutureOr<void> _onGet(TestEventGet event, Emitter<TestState> emit) async {
    await DataHandler.getTest(event.lesson).then((value) {
      print(value);
    });
  }
}
