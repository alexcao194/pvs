part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  const UserInitial();
  @override
  List<Object> get props => [];
}

class UserStateLoading extends UserState {
  const UserStateLoading();
}


class UserStateSignUpSuccessful extends UserState {
  const UserStateSignUpSuccessful({required this.status, required this.id});
  final String status;
  final String id;
  @override
  List<Object> get props => [status, id];
}

class UserStateSignUpFail extends UserState {
  final String error;
  const UserStateSignUpFail({required this.error});

  @override
  List<Object> get props => [error];
}

class UserStateLoginSuccessful extends UserState {
  const UserStateLoginSuccessful();

  @override
  List<Object> get props => [];
}

class UserStateLoginFail extends UserState {
  final String error;
  const UserStateLoginFail({required this.error});

  @override
  List<Object> get props => [error];
}

class UserStateGetPasswordSuccessful extends UserState {
  final String status;
  const UserStateGetPasswordSuccessful({required this.status});

  @override
  List<Object> get props => [status];
}

class UserStateGetPasswordFail extends UserState {
  final String error;
  const UserStateGetPasswordFail({required this.error});

  @override
  List<Object> get props => [error];
}

class UserStateRegistrySuccessful extends UserState {
  final String status;
  const UserStateRegistrySuccessful({required this.status});

  @override
  List<Object> get props => [status];
}

class UserStateRegistryFail extends UserState {
  final String error;
  final String id;
  const UserStateRegistryFail({required this.error, required this.id});

  @override
  List<Object> get props => [error, id];
}