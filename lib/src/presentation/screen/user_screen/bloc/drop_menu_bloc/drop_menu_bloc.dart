import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drop_menu_event.dart';
part 'drop_menu_state.dart';

class DropMenuBloc extends Bloc<DropMenuEvent, DropMenuState> {
  DropMenuBloc() : super(const DropMenuInitial(value: 0)) {
    on<DropMenuEventChange>(_onChange);
  }

  FutureOr<void> _onChange(DropMenuEventChange event, Emitter<DropMenuState> emit) {
    emit(DropMenuStateChanged(value: event.value));
  }
}
