import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pvs/src/service/http.dart';

import '../../model/user.dart';


part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial(user: User())) {
    on<DataEventGetProfile>(_onGetProfile);
  }

  FutureOr<void> _onGetProfile(DataEventGetProfile event, Emitter<DataState> emit) async {
    await HTTP.get('/profile', {
      'id' : event.user.id!
    }).then((value) {
      emit(DataStateGetDataSuccessful(user: User.fromJson(json.decode(value))));
    });
  }
}
