import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pvs/src/service/data_handler.dart';
import 'package:pvs/src/service/stream_socket.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<QuizEventGetQuestion>(_onGetQuestion);
    on<QuizEventListen>(_onListen);
  }

  FutureOr<void> _onGetQuestion(QuizEventGetQuestion event, Emitter<QuizState> emit) async {
    await DataHandler.getQuestion(event.lesson).then((value) {
      if(value!['result'] != null) {
        emit(QuizStateDone(quizs: [
          {
            'result' : value['result']
          }
        ]));
      } else {
        List<Map<String, String>> lt = [];
        for(int i = 0; i < 20; i++) {
          lt.add({
            'question' : value['question-${i + 1}']['question'],
            'answer-1' : value['question-${i + 1}']['answer-1'],
            'answer-2' : value['question-${i + 1}']['answer-2'],
            'answer-3' : value['question-${i + 1}']['answer-3'],
            'answer-4' : value['question-${i + 1}']['answer-4'],
          });
        }
        emit(QuizStateQuestionSuccessful(quizs: lt));
      }
    });
  }

  FutureOr<void> _onListen(QuizEventListen event, Emitter<QuizState> emit) {
    StreamSocket.socket!.on('response', (data) => print(data));
    StreamSocket.socket!.on('send-questions', (data) {
      List<Map<String, String>> res = [];
      for(int i = 1; i <= 20; i++) {
        var map = data['question-$i'];
        Map<String, String> mp = {};
        mp['question'] = map['question'];
        mp['answer-1'] = map['answer-1'];
        mp['answer-2'] = map['answer-2'];
        mp['answer-3'] = map['answer-3'];
        mp['answer-4'] = map['answer-4'];
        res.add(mp);
      }
      StreamSocket.addResponse(res);
    });
  }
}
