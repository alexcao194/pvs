part of 'test_infor_bloc.dart';

abstract class TestInforEvent extends Equatable {
  const TestInforEvent();
}

class TestInforEventGet extends TestInforEvent {
  const TestInforEventGet({required this.lesson});

  final String lesson;

  @override
  List<Object> get props => [lesson];
}

