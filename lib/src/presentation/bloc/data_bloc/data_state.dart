part of 'data_bloc.dart';

abstract class DataState extends Equatable {
  final User user;
  const DataState({required this.user});

  @override
  List<Object> get props => [user];
}

class DataInitial extends DataState {
  const DataInitial({required super.user});
}

class DataStateGetUserSuccessful extends DataState {
  const DataStateGetUserSuccessful({required super.user});
}
