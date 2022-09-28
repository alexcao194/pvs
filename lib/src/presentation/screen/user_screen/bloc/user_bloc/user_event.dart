part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}


class UserEventSignup extends UserEvent {
  const UserEventSignup({
    required this.id,
    required this.password,
    required this.email,
    required this.rePassword
  });

  final String id;
  final String password;
  final String rePassword;
  final String email;

  @override
  List<Object> get props => [id, password, rePassword, email];
}

class UserEventLogin extends UserEvent {
  const UserEventLogin({required this.password, required this.id, required this.context});
  final String id;
  final String password;
  final BuildContext context;

  @override
  List<Object> get props => [id, password, context];
}

class UserEventGetPassword extends UserEvent {
  const UserEventGetPassword({required this.id});

  final String id;

  @override
  List<Object> get props =>[id];
}