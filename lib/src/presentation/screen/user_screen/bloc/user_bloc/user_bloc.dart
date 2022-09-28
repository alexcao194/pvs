import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/bloc/data_bloc/data_bloc.dart';
import 'package:pvs/src/constant/app_string.dart';
import 'package:pvs/src/service/app_router.dart';

import '../../../../../../model/user.dart';
import '../../../../../service/http.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    on<UserEventLogin>(_onLogin);
    on<UserEventSignup>(_onSignup);
    on<UserEventGetPassword>(_getPassword);
  }

  FutureOr<void> _onLogin(UserEventLogin event, Emitter<UserState> emit) async {
    emit(const UserStateLoading());
    print(event.id);
    print(event.password);
    await HTTP.get('/login',
        {
          'id' : event.id,
          'password' : event.password
        }).then((value) {
      print(value);
      if(value == 'incorrect_account') {
        emit(UserStateLoginFail(error: AppString.incorrectAccount));
      } else if(value == 'non_auth') {
        AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.registry);
      } else {
        print(User.fromJson(json.decode(value)));
        User user = User.fromJson(json.decode(value));
        emit(UserStateLoginSuccessful(user: user));
        BlocProvider.of<DataBloc>(event.context).add(DataEventGetProfile(user: user));
        AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.home);
      }
    }).timeout(const Duration(milliseconds: 2000)).onError((error, stackTrace) {
      emit(UserStateLoginFail(error: AppString.serverNotResponse));
    });
  }

  FutureOr<void> _onSignup(UserEventSignup event, Emitter<UserState> emit) async {
    emit(const UserStateLoading());
    if(event.password != event.rePassword) {
      emit(UserStateSignUpFail(error: AppString.passwordNotCompare));
    } else if(event.password == '' || event.email == '' || event.id == '') {
      emit(UserStateSignUpFail(error: AppString.nullField));
    } else
    {
      await HTTP.post('/signup', {
        'id' : event.id,
        'password' : event.password,
        'email' : event.email,
      }).then((value) {
        if(value == 'exists_account') {
          emit(UserStateSignUpFail(error: AppString.existsAccount));
        } else if(value == 'invalid_id') {
          emit(UserStateSignUpFail(error: AppString.invalidId));
        } else if(value == 'invalid_password') {
          emit(UserStateSignUpFail(error: AppString.invalidPassword));
        } else if(value == 'invalid_email') {
          emit(UserStateSignUpFail(error: AppString.invalidEmail));
        } else {
          emit(UserStateSignUpSuccessful(status: AppString.signupSuccessful));
        }
      });
    }
  }

  FutureOr<void> _getPassword(UserEventGetPassword event, Emitter<UserState> emit) {
  }
}
