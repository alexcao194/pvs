part of 'lessons_bloc.dart';

abstract class LessonsState extends Equatable {
  const LessonsState({required this.currentLesson, required this.lessons, required this.totalLesson});

  final int totalLesson;
  final int currentLesson;
  final List<String> lessons;

  @override
  List<Object> get props => [totalLesson, currentLesson, lessons];
}

class LessonsInitial extends LessonsState {
  LessonsInitial() : super(currentLesson: 0, lessons: [], totalLesson: 0);
}

class LessonsStateGetSuccessful extends LessonsState {
  const LessonsStateGetSuccessful({required super.lessons, required super.currentLesson, required super.totalLesson});
}

class LessonsStateGetFail extends LessonsState {
  LessonsStateGetFail() : super(currentLesson: 1, lessons: ['get fail'], totalLesson: 1);
}