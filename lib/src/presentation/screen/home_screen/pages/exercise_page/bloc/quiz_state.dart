part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();
}

class QuizInitial extends QuizState {
  const QuizInitial();

  @override
  List<Object?> get props => [];
}

class QuizStateQuestionSuccessful extends QuizState {
  const QuizStateQuestionSuccessful({required this.questions})  ;
  final List<Map<String, String>> questions;
  //final String score;
  @override
  List<Object?> get props => [questions];
}