import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pvs/src/model/test.dart';
import 'package:pvs/src/service/data_handler.dart';

part 'test_infor_event.dart';
part 'test_infor_state.dart';

class TestInforBloc extends Bloc<TestInforEvent, TestInforState> {
  TestInforBloc() : super(TestInforInitial(test: Test())) {
    on<TestInforEventGet>(_onGet);
  }

  FutureOr<void> _onGet(TestInforEventGet event, Emitter<TestInforState> emit) async {
    await DataHandler.getTestInfor(event.lesson).then((value) {
      emit(TestInforBlocGetDone(test: Test.fromJson(value)));
    });
  }
}


