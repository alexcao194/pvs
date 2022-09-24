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

  FutureOr<void> _onLogin(UserEventLogin event, Emitter<UserState> emit) async {
    Socket.instance!.emit(
        'require_signup',
        {
          'id' : 'B21DCCN235',
          'password' : '111111'
        });
    emit(UserStateLoading());
    Socket.instance!.on('login_state_success',(data) {
      User tempUser = User.fromJson(data);
      emit(UserStateLoginSuccessful(user: tempUser));
    });
  }

  FutureOr<void> _onSignup(UserEventSignup event, Emitter<UserState> emit) {
  }

  FutureOr<void> _getPassword(UserEventGetPassword event, Emitter<UserState> emit) {
  }
}
