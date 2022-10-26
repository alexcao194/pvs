import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pvs/src/model/user.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/local_authentication.dart';


part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial(user: User())) {
    on<DataEventGetUser>(_onGetUser);
    on<DataEventUploadAvatar>(_onUpload);
  }

  FutureOr<void> _onGetUser(DataEventGetUser event, Emitter<DataState> emit) async {
    await LocalAuthentication
        .getUser(LocalAuthentication.token!)
        .then((value) {
      User user = User.fromJson(value!);
      emit(DataStateGetUserSuccessful(user: user));
      AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.home);
    });
  }


  FutureOr<void> _onUpload(DataEventUploadAvatar event, Emitter<DataState> emit) {
    
  }
}
