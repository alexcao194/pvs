part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserEventSignup extends UserEvent {
  const UserEventSignup(
      {required this.id,
      required this.password,
      required this.email,
      required this.rePassword});

  final String id;
  final String password;
  final String rePassword;
  final String email;

  @override
  List<Object> get props => [id, password, rePassword, email];
}

class UserEventLogin extends UserEvent {
  const UserEventLogin(
      {required this.password, required this.id, required this.context});

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
  List<Object> get props => [id];
}

class UserEventRegistry extends UserEvent {
  const UserEventRegistry(
      {required this.gender,
      required this.group,
      required this.phoneNumber,
      required this.displayName,
      required this.birthday,
      required this.id,
      required this.context,
        this.avatar});

  final String displayName;
  final String birthday;
  final String group;
  final String gender;
  final String phoneNumber;
  final String id;
  final BuildContext context;
  final XFile? avatar;

  @override
  List<Object> get props => [avatar!, displayName, birthday, group, gender, phoneNumber, id, context];
}

class UserEventUpdateProfile extends UserEvent {
  const UserEventUpdateProfile({required this.avatar, required this.gender, required this.birthday, required this.phoneNumber, required this.email, required this.context});

  final String birthday;
  final String email;
  final String phoneNumber;
  final String gender;
  final XFile? avatar;
  final BuildContext context;

  @override
  List<Object> get props => [avatar!, birthday, gender, phoneNumber, context];

}