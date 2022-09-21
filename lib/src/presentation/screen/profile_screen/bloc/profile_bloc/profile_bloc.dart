import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileInitial(canEdit: false)) {
    on<ProfileEventChangeState>(_onChange);
  }

  FutureOr<void> _onChange(ProfileEventChangeState event, Emitter<ProfileState> emit) {
    emit(ProfileStateChanged(canEdit: event.canEdit));
  }
}
