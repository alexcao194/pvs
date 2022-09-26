import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shared_preferences_event.dart';
part 'shared_preferences_state.dart';

class SharedPreferencesBloc extends Bloc<SharedPreferencesEvent, SharedPreferencesState> {
  SharedPreferencesBloc() : super(SharedPreferencesInitial()) {
    on<SharedPreferencesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
