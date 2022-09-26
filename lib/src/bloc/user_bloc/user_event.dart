part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}


class UserEventSignup extends UserEvent {
  const UserEventSignup({required this.id, required this.password});

  final String id;
  final String password;

  @override
  List<Object> get props => [id, password];
}

class UserEventLogin extends UserEvent {
  const UserEventLogin({required this.password, required this.id});
  final String id;
  final String password;

  @override
  List<Object> get props => [id, password];
}

class UserEventGetPassword extends UserEvent {
  const UserEventGetPassword({required this.id});

  final String id;

  @override
  List<Object> get props =>[id];
}