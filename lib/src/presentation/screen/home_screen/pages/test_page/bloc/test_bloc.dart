import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
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
      List<List<Widget>> tests = [];
      List<List<TextEditingController>> controllerss = [];
      for(int o = 0; o < value.length; o++) {
        List<Widget> test = [];
        List<TextEditingController> controllers = [];
        int testLenght = value[o].length;
        for(int i = 0; i < testLenght; i++) {
          int sentenceLength = value[o]['sentence_${i + 1}'].length;
          if(value[o]['sentence_${i + 1}'][0] == '' && sentenceLength == 1) {
            test.add(const Text('\n', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)));
            continue;
          } else if(value[o]['sentence_${i + 1}'][0].toString().startsWith('\$')) {
            test.add(Padding(
              padding: const EdgeInsets.all(8.0),
              child: Math.tex(value[o]['sentence_${i + 1}'][0].toString().replaceAll('\$', ''), textStyle: const TextStyle(fontWeight: FontWeight.bold)),
            ));
          } else {
            for(int j = 0; j < sentenceLength; j++) {
              if(j == 0) {
                test.add(Text(value[o]['sentence_${i + 1}'][j].toString().replaceAll(r'''<endline/>''', ''), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)));
              } else {
                controllers.add(TextEditingController());
                test.add(BlankBox(controller: controllers.last));
                test.add(Text(value[o]['sentence_${i + 1}'][j].toString().replaceAll(r'''<endline/>''', ''), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)));
              }
              if(value[o]['sentence_${i + 1}'][j].toString().endsWith(r'''<endline/>''')) {
                test.add(const SizedBox(width: double.maxFinite));
              }
            }
          }
        }
        controllerss.add(controllers);
        tests.add(test);
      }
      emit(TestStateGenerateDone(test: tests, controllers: controllerss,countTest: value.length));
    });
  }
}
