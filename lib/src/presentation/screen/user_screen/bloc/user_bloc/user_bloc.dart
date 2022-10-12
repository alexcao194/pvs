import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pvs/src/bloc/data_bloc/data_bloc.dart';
import 'package:pvs/src/constant/app_string.dart';
import 'package:pvs/src/model/account.dart';
import 'package:pvs/src/model/user.dart';
import 'package:pvs/src/service/app_router.dart';

import '../../../../../service/http.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    on<UserEventLogin>(_onLogin);
    on<UserEventSignup>(_onSignup);
    on<UserEventGetPassword>(_getPassword);
    on<UserEventRegistry>(_onRegistry);
  }

  FutureOr<void> _onLogin(UserEventLogin event, Emitter<UserState> emit) async {
    emit(const UserStateLoading());
    await HTTP
        .get('/login', {'id': event.id, 'password': event.password})
        .then((value) {
          if (value == 'incorrect_account') {
            emit(UserStateLoginFail(error: AppString.incorrectAccount));
          } else {
            Account account = Account.fromJson(json.decode(value));
            emit(UserStateLoginSuccessful(account: account));
            if (account.auth == 0) {
              AppRouter.navigatorKey.currentState
                  ?.pushReplacementNamed(AppRoutes.registry);
            } else {
              BlocProvider.of<DataBloc>(event.context)
                  .add(DataEventGetProfileFromLogin(user: User(id: account.id)));
            }
          }
        })
        .timeout(const Duration(milliseconds: 2000))
        .onError((error, stackTrace) {
          emit(UserStateLoginFail(error: error.toString()));
        });
  }

  FutureOr<void> _onSignup(
      UserEventSignup event, Emitter<UserState> emit) async {
    emit(const UserStateLoading());
    if (event.password != event.rePassword) {
      emit(UserStateSignUpFail(error: AppString.passwordNotCompare));
    } else if (event.password == '' || event.email == '' || event.id == '') {
      emit(UserStateSignUpFail(error: AppString.nullField));
    } else {
      await HTTP.post('/signup', {
        'id': event.id,
        'password': event.password,
        'email': event.email,
      }).then((value) {
        if (value == 'exists_account') {
          emit(UserStateSignUpFail(error: AppString.existsAccount));
        } else if (value == 'invalid_id') {
          emit(UserStateSignUpFail(error: AppString.invalidId));
        } else if (value == 'invalid_password') {
          emit(UserStateSignUpFail(error: AppString.invalidPassword));
        } else if (value == 'invalid_email') {
          emit(UserStateSignUpFail(error: AppString.invalidEmail));
        } else {
          emit(UserStateSignUpSuccessful(status: AppString.signupSuccessful));
        }
      });
    }
  }

  FutureOr<void> _getPassword(
      UserEventGetPassword event, Emitter<UserState> emit) {}

  FutureOr<void> _onRegistry(UserEventRegistry event, Emitter<UserState> emit) async {
    if (event.displayName == '' ||
        event.group.toString() == '' ||
        event.birthday == '' ||
        event.gender.toString() == '' ||
        event.phoneNumber == '') {
      emit(UserStateRegistryFail(error: AppString.nullField, id: event.id));
    } else {
      emit(const UserStateLoading());
      await HTTP
          .post('/registry', {
            'id': event.id,
            'display_name': event.displayName,
            'group_class': event.group.toString(),
            'birthday': event.birthday,
            'gender': event.gender.toString(),
            'phone_number': event.phoneNumber
          })
          .then((value) async {
            if (value == 'registry_successful') {
              if (event.avatar != null) {
                await HTTP.upload(
                    '/upload_avatar',
                    File(event.avatar!.path).path,
                    '${event.id}_avatar.jpg',
                    {'id': event.id}).then((value) {
                  debugPrint('update successful with code = $value');
                  BlocProvider.of<DataBloc>(event.context)
                      .add(DataEventGetProfile(user: User(id: event.id)));
                  emit(UserStateRegistrySuccessful(status: AppString.getStart));
                  AppRouter.navigatorKey.currentState
                      ?.pushReplacementNamed(AppRoutes.home);
                }).onError((error, stackTrace) {
                  debugPrint('error with code = $error');
                });
              } else {
                BlocProvider.of<DataBloc>(event.context)
                    .add(DataEventGetProfile(user: User(id: event.id)));
                emit(UserStateRegistrySuccessful(status: AppString.getStart));
                AppRouter.navigatorKey.currentState
                    ?.pushReplacementNamed(AppRoutes.home);
              }
            } else if (value == 'internal_error') {
              emit(UserStateRegistryFail(
                  error: AppString.internalError, id: event.id));
            }
          })
          .timeout(const Duration(milliseconds: 2000))
          .onError((error, stackTrace) {
            emit(UserStateRegistryFail(
                error: AppString.serverNotResponse, id: event.id));
          });
    }
  }
}
