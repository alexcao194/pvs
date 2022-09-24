import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pvs/src/service/socket.dart';

import '../../../model/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEventLogin>(_onLogin);
    on<UserEventSignup>(_onSignup);
    on<UserEventGetPassword>(_getPassword);
  }

  FutureOr<void> _onLogin(UserEventLogin event, Emitter<UserState> emit) {
    Socket.instance!.emit('require_login', {
      'id' : event.id,
      'password' : event.password
    });
  }

  FutureOr<void> _onSignup(UserEventSignup event, Emitter<UserState> emit) {
    Socket.instance!.emit('require_signup', {
      'id' : event.id,
      'password' : event.password
    });
  }

  FutureOr<void> _getPassword(UserEventGetPassword event, Emitter<UserState> emit) {
  }
}
