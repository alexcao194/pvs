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

class TestEventSubmit extends TestEvent {
  const TestEventSubmit({required this.context, required this.pageController, required this.test, required this.totalTest, required this.controllers, required this.lesson});

  final PageController pageController;
  final List<TextEditingController> controllers;
  final int test;
  final int totalTest;
  final String lesson;
  final BuildContext context;

  @override
  List<Object?> get props => [pageController, test, totalTest, controllers];
}