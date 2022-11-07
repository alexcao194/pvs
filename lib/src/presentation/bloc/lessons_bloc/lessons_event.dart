part of 'lessons_bloc.dart';

abstract class LessonsEvent extends Equatable {
  const LessonsEvent();

  @override
  List<Object> get props => [];
}

class LessonsEventGet extends LessonsEvent {
  const LessonsEventGet({required this.context, required this.id});

  final BuildContext context;
  final String id;

  @override
  List<Object> get props => [id, context];
}

class LessonsEventChange extends LessonsEvent {
  const LessonsEventChange({required this.pickedLesson, required this.state, required this.context, required this.id});

  final LessonsState state;
  final int pickedLesson;
  final String id;
  final BuildContext context;

  @override
  List<Object> get props => [state, pickedLesson, id, context];
}