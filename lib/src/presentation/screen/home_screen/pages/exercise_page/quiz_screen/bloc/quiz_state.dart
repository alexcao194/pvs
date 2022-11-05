part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState({required this.quizs});

  final List<Map<String, String>> quizs;

  @override
  List<Object?> get props => [quizs];
}

class QuizInitial extends QuizState {
  QuizInitial() : super(quizs: [
    {
      'question' : 'nodata',
      'answer-1': 'nodata',
      'answer-2': 'nodata',
      'answer-3': 'nodata',
      'answer-4': 'nodata',
    }
  ]);

  @override
  List<Object?> get props => [];
}

class QuizStateQuestionSuccessful extends QuizState {
  const QuizStateQuestionSuccessful({required super.quizs});
}