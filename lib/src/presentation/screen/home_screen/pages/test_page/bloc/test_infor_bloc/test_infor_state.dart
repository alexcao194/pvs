part of 'test_infor_bloc.dart';

abstract class TestInforState extends Equatable {
  const TestInforState({required this.test});

  final Test test;

  @override
  List<Object> get props => [test];
}

class TestInforInitial extends TestInforState {
  const TestInforInitial({required super.test});
}

class TestInforBlocGetDone extends TestInforState {
  const TestInforBlocGetDone({required super.test});


}