import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pvs/src/constant/app_string.dart';
import 'package:pvs/src/presentation/bloc/data_bloc/data_bloc.dart';
import 'package:pvs/src/presentation/bloc/lessons_bloc/lessons_bloc.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/shared_preferences.dart';
import '../../../../../service/local_authentication.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    on<UserEventLogin>(_onLogin);
    on<UserEventSignup>(_onSignup);
    on<UserEventGetPassword>(_getPassword);
    on<UserEventRegistry>(_onRegistry);
    on<UserEventUpdateProfile>(_onUpdate);
    on<UserEventRelogin>(_onRelogin);
    on<UserEventLogout>(_onLogout);
  }

  FutureOr<void> _onLogin(UserEventLogin event, Emitter<UserState> emit) async {
    emit(const UserStateLoading());
    await LocalAuthentication
        .login(event.id, event.password)
        .then((value) {
      switch(value) {
            case 'input-empty':
              emit(UserStateLoginFail(error: AppString.nullField));
              break;
            case 'incorrect-account':
              emit(UserStateLoginFail(error: AppString.incorrectAccount));
              break;
            case 'not-registry':
              emit(UserStateSignUpSuccessful(status: AppString.signupSuccessful, id: event.id));
              AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.registry);
              break;
            case 'login-successful':
              BlocProvider.of<DataBloc>(event.context).add(const DataEventGetUser());
              BlocProvider.of<LessonsBloc>(event.context).add(LessonsEventGet(context: event.context, id: Prefs.get('id')));
              emit(const UserStateLoginSuccessful());
              break;
          }
        })
        .timeout(const Duration(milliseconds: 2000))
        .onError((error, stackTrace) {
          emit(UserStateLoginFail(error: error.toString()));
        });
  }

  FutureOr<void> _onRelogin(UserEventRelogin event, Emitter<UserState> emit) async {
    await LocalAuthentication.getUser(Prefs.get('token')).then((value) async {
      switch(value!['message']) {
        case 'no-ip4':
          AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.connect);
          break;
        case 'unauthorized':
          await LocalAuthentication.refreshToken().then((value) {
            if(value['message'] != null) {
              print('test relogin');
              print(value);
              AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.login);
            } else {
              Prefs.set('token', value['accessToken']);
              BlocProvider.of<LessonsBloc>(event.context).add(LessonsEventGet(context: event.context, id: Prefs.get('id')));
              BlocProvider.of<DataBloc>(event.context).add(const DataEventGetUser());
            }
          }).onError((error, stackTrace) {
          });
          break;
        default:
          BlocProvider.of<LessonsBloc>(event.context).add(LessonsEventGet(context: event.context, id: Prefs.get('id')));
          BlocProvider.of<DataBloc>(event.context).add(const DataEventGetUser());
          break;
      }
    }).timeout(const Duration(milliseconds: 2000))
    .onError((error, stackTrace) {
      AppRouter.navigatorKey.currentState?.pushNamed(AppRoutes.connect);
    });
  }

  FutureOr<void> _onSignup(UserEventSignup event, Emitter<UserState> emit) async {
    emit(const UserStateLoading());
    await LocalAuthentication.signup(event.id, event.password, event.rePassword, event.email)
        .then((value) {
          switch(value) {
            case "input-empty":
              emit(UserStateSignUpFail(error: AppString.nullField));
              break;
            case "password-not-match":
              emit(UserStateSignUpFail(error: AppString.passwordNotCompare));
              break;
            case "exists-account":
              emit(UserStateSignUpFail(error: AppString.existsAccount));
              break;
            case "invalid-password":
              emit(UserStateSignUpFail(error: AppString.invalidPassword));
              break;
            case "invalid-email":
              emit(UserStateSignUpFail(error: AppString.invalidEmail));
              break;
            case "invalid-id":
              emit(UserStateSignUpFail(error: AppString.invalidId));
              break;
            case "signup-successful":
              emit(UserStateSignUpSuccessful(status: AppString.signupSuccessful, id: event.id));
              AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.registry);
              break;
          }
    });
  }

  FutureOr<void> _getPassword(UserEventGetPassword event, Emitter<UserState> emit) {

  }

  FutureOr<void> _onRegistry(UserEventRegistry event, Emitter<UserState> emit) async {
    if(event.id == "") {
      emit(UserStateRegistryFail(error: AppString.existsAccount, id: event.id));
      return;
    }
    emit(const UserStateLoading());
    await LocalAuthentication.registry(
        event.displayName,
        event.birthday,
        event.group,
        event.gender,
        event.phoneNumber,
        event.id,
        event.avatar
    ).then((value) {
      switch(value) {
        case 'input-empty':
          emit(UserStateRegistryFail(error: AppString.nullField, id: event.id));
          break;
        case 'invalid-phone-number':
          emit(UserStateRegistryFail(error: AppString.invalidNumber, id: event.id));
          break;
        case 'exits-infor':
          emit(UserStateRegistryFail(error: AppString.existsAccount, id: event.id));
          break;
        case 'registry-successful':
          emit(UserStateRegistrySuccessful(status: AppString.signupSuccessful));
          break;
      }
    });
  }

  FutureOr<void> _onUpdate(UserEventUpdateProfile event, Emitter<UserState> emit) async {
    await LocalAuthentication.updateProfile(event.email, event.phoneNumber, event.birthday, event.gender, event.avatar)
    .then((value) async {
      if(value == 'invalid-phone-number') {

      } else if(value == 'invalid-email') {

      } else {
        if(event.avatar != null) {
          await LocalAuthentication.upload('/avatar', File(event.avatar!.path).path, '$value/avatar.jpg', {}).then((value) {
            BlocProvider.of<DataBloc>(event.context).add(const DataEventGetUser());
          });
        } else {
          BlocProvider.of<DataBloc>(event.context).add(const DataEventGetUser() );
        }
      }
    });
  }

  FutureOr<void> _onLogout(UserEventLogout event, Emitter<UserState> emit) {
    Prefs.set('token', '');
    Prefs.set('refreshToken', '');
    AppRouter.navigatorKey.currentState?.pushNamedAndRemoveUntil(AppRoutes.login, ModalRoute.withName('/'));
    emit(const UserSateLogout());
  }
}
