import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/widget/blank_box.dart';
import 'package:pvs/src/service/data_handler.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<TestEventGet>(_onGet);
  }

  FutureOr<void> _onGet(TestEventGet event, Emitter<TestState> emit) async {
    await DataHandler.getTest(event.lesson).then((value) {
      List<InlineSpan> test = [];
      int testLenght = value.length;
      for(int i = 0; i < testLenght; i++) {
        int sentenceLength = value['sentence_${i + 1}'].length;
        if(value['sentence_${i + 1}'][0] == '' && sentenceLength == 1) {
          test.add(const TextSpan(text: '\n', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)));
          continue;
        }
        for(int j = 0; j < sentenceLength; j++) {
          if(j == 0) {
            test.add(TextSpan(text: value['sentence_${i + 1}'][j], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)));
          } else {
            test.add(const WidgetSpan(child: BlankBox()));
            test.add(TextSpan(text: value['sentence_${i + 1}'][j], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)));
          }
        }
        test.add(const TextSpan(text: '\n', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)));
      }
      emit(TestStateGenerateDone(test: test));
    });
  }
}
