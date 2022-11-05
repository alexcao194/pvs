part of 'lessons_bloc.dart';

abstract class LessonsEvent extends Equatable {
  const LessonsEvent();

  @override
  List<Object> get props => [];
}

class LessonsEventGet extends LessonsEvent {
  const LessonsEventGet();
}

class LessonsEventChange extends LessonsEvent {
  const LessonsEventChange({required this.pickedLesson, required this.state});

  final LessonsState state;
  final int pickedLesson;
}