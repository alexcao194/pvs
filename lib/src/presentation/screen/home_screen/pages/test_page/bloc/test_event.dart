part of 'test_bloc.dart';

abstract class TestEvent extends Equatable {
  const TestEvent();
}

class TestEventGet extends TestEvent {
  const TestEventGet({required this.lesson});

  final String lesson;
  @override
  List<Object?> get props => [lesson];
}