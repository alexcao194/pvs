import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_tex/flutter_tex.dart';
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
      List<Widget> test = [];
      int testLenght = value.length;
      for(int i = 0; i < testLenght; i++) {
        int sentenceLength = value['sentence_${i + 1}'].length;
        if(value['sentence_${i + 1}'][0] == '' && sentenceLength == 1) {
          test.add(const Text('\n', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)));
          continue;
        } else if(value['sentence_${i + 1}'][0].toString().startsWith('\$')) {
          test.add(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Math.tex(value['sentence_${i + 1}'][0].toString().replaceAll('\$', ''), textStyle: const TextStyle(fontWeight: FontWeight.bold)),
          ));
        } else {
          for(int j = 0; j < sentenceLength; j++) {
            if(j == 0) {
              test.add(Text(value['sentence_${i + 1}'][j].toString().replaceAll(r'''<endline/>''', ''), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)));
            } else {
              test.add(const BlankBox());
              test.add(Text(value['sentence_${i + 1}'][j].toString().replaceAll(r'''<endline/>''', ''), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)));
            }
            if(value['sentence_${i + 1}'][j].toString().endsWith(r'''<endline/>''')) {
              test.add(const SizedBox(width: double.maxFinite));
            }
          }
        }
      }
      emit(TestStateGenerateDone(test: test));
    });
  }
}
