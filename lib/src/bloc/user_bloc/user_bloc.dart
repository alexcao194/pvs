import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/user.dart';
import '../../service/http.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEventLogin>(_onLogin);
    on<UserEventSignup>(_onSignup);
    on<UserEventGetPassword>(_getPassword);
  }

  FutureOr<void> _onLogin(UserEventLogin event, Emitter<UserState> emit) async {
    emit(const UserStateLoading());
    await HTTP.get('localhost:1904/login',
    {
      'id' : 'B21DCCN235',
      'password' : '111111'
    }).then((value) {
      emit(UserStateLoginSuccessful(user: User.fromJson(json.decode(value))));
    });

  }

  Future<User> a(User user) async {

    return user;
  }

  FutureOr<void> _onSignup(UserEventSignup event, Emitter<UserState> emit) {
  }

  FutureOr<void> _getPassword(UserEventGetPassword event, Emitter<UserState> emit) {
  }
}
