part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class QuizEventGetQuestion extends QuizEvent {
  const QuizEventGetQuestion();
  @override
  List<Object?> get props => [];
}

class QuizEventListen extends QuizEvent {
  const QuizEventListen();
  @override
  List<Object?> get props => [];

}