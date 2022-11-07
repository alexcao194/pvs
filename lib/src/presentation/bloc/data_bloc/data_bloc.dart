import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/model/user.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/bloc/quiz_result_bloc/quiz_result_bloc.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/data_handler.dart';
import 'package:pvs/src/service/local_authentication.dart';

import '../../../service/shared_preferences.dart';


part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial(user: User())) {
    on<DataEventGetUser>(_onGetUser);
    on<DataEventUploadAvatar>(_onUpload);
    on<DataEventLogout>(_onLogout);
  }

  FutureOr<void> _onGetUser(DataEventGetUser event, Emitter<DataState> emit) async {
    await LocalAuthentication
        .getUser(Prefs.get('token'))
        .then((value) {
      if(value!['message'] == 'no-ip4') {
        AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.connect);
      } else if(value['message'] == 'no-token-provided') {
        AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.login);
      } else {
          User user = User.fromJson(value);
          emit(DataStateGetUserSuccessful(user: user));
          AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.home);
        }
      }
    );
  }

  FutureOr<void> _onUpload(DataEventUploadAvatar event, Emitter<DataState> emit) {
    
  }

  FutureOr<void> _onLogout(DataEventLogout event, Emitter<DataState> emit) {
    emit(DataInitial(user: User()));
  }
}
