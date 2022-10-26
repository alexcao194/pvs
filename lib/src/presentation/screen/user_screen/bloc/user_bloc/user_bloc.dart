import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pvs/src/constant/app_string.dart';
import 'package:pvs/src/presentation/bloc/data_bloc/data_bloc.dart';

import '../../../../../model/user.dart';
import '../../../../../service/local_authentication.dart';

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
    // emit(const UserStateLoading());
    await LocalAuthentication
        .login(event.id.toUpperCase(), event.password)
        .then((value) async {
          switch(value) {
            case 'unauthorized':
              emit(UserStateLoginFail(error: AppString.incorrectAccount));
              break;
            default:
              emit(UserStateLoginSuccessful(id: value!));
              BlocProvider.of<DataBloc>(event.context).add(DataEventGetUser(user: User(id: value)));
              break;
          }
        })
        .timeout(const Duration(milliseconds: 2000))
        .onError((error, stackTrace) {
          emit(UserStateLoginFail(error: error.toString()));
        });
    // await AppDio.login(event.id, event.password);
  }

  FutureOr<void> _onSignup(UserEventSignup event, Emitter<UserState> emit) async {
    // emit(const UserStateLoading());
    // if (event.password != event.rePassword) {
    //   emit(UserStateSignUpFail(error: AppString.passwordNotCompare));
    // } else if (event.password == '' || event.email == '' || event.id == '') {
    //   emit(UserStateSignUpFail(error: AppString.nullField));
    // } else {
    //   await LocalAuthentication.post('/signup', {
    //     'id': event.id,
    //     'password': event.password,
    //     'email': event.email,
    //   }).then((value) {
    //     if (value == 'exists_account') {
    //       emit(UserStateSignUpFail(error: AppString.existsAccount));
    //     } else if (value == 'invalid_id') {
    //       emit(UserStateSignUpFail(error: AppString.invalidId));
    //     } else if (value == 'invalid_password') {
    //       emit(UserStateSignUpFail(error: AppString.invalidPassword));
    //     } else if (value == 'invalid_email') {
    //       emit(UserStateSignUpFail(error: AppString.invalidEmail));
    //     } else {
    //       emit(UserStateSignUpSuccessful(status: AppString.signupSuccessful));
    //     }
    //   });
    // }
  }

  FutureOr<void> _getPassword(UserEventGetPassword event, Emitter<UserState> emit) {}

  FutureOr<void> _onRegistry(UserEventRegistry event, Emitter<UserState> emit) async {
    // if (event.displayName == '' ||
    //     event.group.toString() == '' ||
    //     event.birthday == '' ||
    //     event.gender.toString() == '' ||
    //     event.phoneNumber == '') {
    //   emit(UserStateRegistryFail(error: AppString.nullField, id: event.id));
    // } else {
    //   emit(const UserStateLoading());
    //   await LocalAuthentication
    //       .post('/registry', {
    //         'id': event.id,
    //         'display_name': event.displayName,
    //         'group_class': event.group.toString(),
    //         'birthday': event.birthday,
    //         'gender': event.gender.toString(),
    //         'phone_number': event.phoneNumber
    //       })
    //       .then((value) async {
    //         if (value == 'registry_successful') {
    //           if (event.avatar != null) {
    //             await LocalAuthentication.upload(
    //                 '/upload_avatar',
    //                 File(event.avatar!.path).path,
    //                 '${event.id}_avatar.jpg',
    //                 {'id': event.id}).then((value) {
    //               debugPrint('update successful with code = $value');
    //               BlocProvider.of<DataBloc>(event.context)
    //                   .add(DataEventGetProfile(user: User(id: event.id)));
    //               emit(UserStateRegistrySuccessful(status: AppString.getStart));
    //               AppRouter.navigatorKey.currentState
    //                   ?.pushReplacementNamed(AppRoutes.home);
    //             }).onError((error, stackTrace) {
    //               debugPrint('error with code = $error');
    //             });
    //           } else {
    //             BlocProvider.of<DataBloc>(event.context)
    //                 .add(DataEventGetProfile(user: User(id: event.id)));
    //             emit(UserStateRegistrySuccessful(status: AppString.getStart));
    //             AppRouter.navigatorKey.currentState
    //                 ?.pushReplacementNamed(AppRoutes.home);
    //           }
    //         } else if (value == 'internal_error') {
    //           emit(UserStateRegistryFail(
    //               error: AppString.internalError, id: event.id));
    //         }
    //       })
    //       .timeout(const Duration(milliseconds: 2000))
    //       .onError((error, stackTrace) {
    //         emit(UserStateRegistryFail(
    //             error: AppString.serverNotResponse, id: event.id));
    //       });
    // }
  }
}
