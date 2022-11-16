import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/widget/blank_box.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/test_page/bloc/test_infor_bloc/test_infor_bloc.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/data_handler.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<TestEventGet>(_onGet);
    on<TestEventSubmit>(_onSubmit);
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

  FutureOr<void> _onSubmit(TestEventSubmit event, Emitter<TestState> emit) async {
    List<String> result = [];
    for (int i = 0; i < event.controllers.length; i++) {
      if(event.controllers[i].value.text != '') {
        result.add(event.controllers[i].value.text);
      } else {
        showDialog(context: event.context, builder: (context) {
          return AlertDialog(
            content: const Text('Hãy điền tất cả các trường trước khi nộp'),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(event.context).pop();
              },
                  child: const Text('ok', style: TextStyle(color: Colors.red))
              )
            ],
          );
        });
        break;
      }
    }
    if(result.length == event.controllers.length) {
      showDialog(context: event.context, builder: (context) {
        return AlertDialog(
          content: const Text('Sau khi bấm nộp bài sẽ không thể quay lại, bạn có chắc muốn nộp bài?'),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(event.context).pop();
            }, child: const Text('Hủy', style: TextStyle(color: Colors.red))),
            TextButton(onPressed: () async {
              Navigator.of(event.context).pop();
              await DataHandler.submitTest(event.lesson, event.test, result).then((value) {
                if(value['message'] == 'done') {
                  BlocProvider.of<TestInforBloc>(event.context).add(TestInforEventGet(lesson: event.lesson));
                  if(event.totalTest != event.test + 1) {
                    event.pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
                  } else {
                    BlocProvider.of<TestInforBloc>(event.context).add(TestInforEventGet(lesson: event.lesson));
                    AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.home);
                  }
                }
              }).timeout(const Duration(milliseconds: 2000)).onError((error, stackTrace) {

              });

            }, child: const Text('Nộp', style: TextStyle(color: Colors.red)))
          ],
        );
      });
    } else {
      // do sth
    }

  }
}
