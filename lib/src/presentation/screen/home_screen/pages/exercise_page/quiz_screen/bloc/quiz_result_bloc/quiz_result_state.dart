part of 'quiz_result_bloc.dart';

abstract class QuizResultState extends Equatable {
  const QuizResultState();
}

class QuizResultInitial extends QuizResultState {
  @override
  List<Object> get props => [];
}

class QuizResultStateDone extends QuizResultState {
  const QuizResultStateDone({required this.result});

  final String result;

  @override
  List<Object> get props => [result];
}

class QuizResultStateGoingOn extends QuizResultState {
  const QuizResultStateGoingOn({required this.currentQuiz});

  final int currentQuiz;

  @override
  List<Object> get props => [currentQuiz];
}