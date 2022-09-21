part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent({required this.canEdit});

  final bool canEdit;

  @override
  List<Object> get props => [canEdit];
}

class ProfileEventChangeState extends ProfileEvent {
  const ProfileEventChangeState({required super.canEdit});
}