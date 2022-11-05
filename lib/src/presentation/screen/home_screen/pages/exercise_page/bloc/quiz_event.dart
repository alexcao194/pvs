part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class QuizEventGetQuestion extends QuizEvent {
  const QuizEventGetQuestion({required this.lesson});

  final String lesson;

  @override
  List<Object?> get props => [lesson];
}

class QuizEventListen extends QuizEvent {
  const QuizEventListen();
  @override
  List<Object?> get props => [];

}