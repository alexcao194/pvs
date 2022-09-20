part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState({required this.canEdit});

  final bool canEdit;

  @override
  List<Object> get props => [canEdit];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial({required super.canEdit});
}

class ProfileStateChanged extends ProfileState {
  const ProfileStateChanged({required super.canEdit});
}


