import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/constant/app_string.dart';
import 'package:pvs/src/service/app_router.dart';

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
    await HTTP.get('/login',
    {
      'id' : 'B21DCCN235',
      'password' : '111111'
    }).then((value) {
      print(value);
      if(value == 'incorrect_account') {
        emit(UserStateLoginFail(error: AppString.incorrectAccount));
      } else {
        print(User.fromJson(json.decode(value)));
        emit(UserStateLoginSuccessful(user: User.fromJson(json.decode(value))));
        AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.home);
      }
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
