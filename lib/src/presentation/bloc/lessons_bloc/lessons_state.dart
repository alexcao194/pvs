part of 'lessons_bloc.dart';

abstract class LessonsState extends Equatable {
  const LessonsState({required this.pickedLesson, required this.currentLesson, required this.lessons, required this.totalLesson});

  final int totalLesson;
  final int currentLesson;
  final int pickedLesson;
  final List<String> lessons;

  @override
  List<Object> get props => [totalLesson, currentLesson, lessons, pickedLesson];
}

class LessonsInitial extends LessonsState {
  LessonsInitial() : super(currentLesson: 0, lessons: [], totalLesson: 0, pickedLesson: 0);
}

class LessonsStateGetSuccessful extends LessonsState {
  const LessonsStateGetSuccessful({required super.lessons, required super.currentLesson, required super.totalLesson, required super.pickedLesson});
}

class LessonsStateGetFail extends LessonsState {
  LessonsStateGetFail() : super(currentLesson: 1, lessons: ['get fail'], totalLesson: 1, pickedLesson: 0);
}

