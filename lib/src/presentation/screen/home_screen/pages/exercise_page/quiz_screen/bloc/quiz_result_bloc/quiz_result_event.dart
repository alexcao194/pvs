part of 'quiz_result_bloc.dart';

abstract class QuizResultEvent extends Equatable {
  const QuizResultEvent();

  @override
  List<Object> get props => [];
}

class QuizResultEventGet extends QuizResultEvent {
  const QuizResultEventGet({required this.id, required this.lesson});

  final String id;
  final String lesson;

  @override
  List<Object> get props => [id, lesson];
}