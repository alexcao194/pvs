part of 'test_bloc.dart';

abstract class TestState extends Equatable {
  const TestState();
}

class TestInitial extends TestState {
  @override
  List<Object> get props => [];
}

class TestStateGenerateDone extends TestState {
  const TestStateGenerateDone({required this.test});

  final List<InlineSpan> test;

  @override
  List<Object> get props => [test];
}