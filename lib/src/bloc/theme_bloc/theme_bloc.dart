import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pvs/src/config/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial(darkMode: false)) {
    on<ThemeEventChangeTheme>(_onChange);
  }

  FutureOr<void> _onChange(ThemeEventChangeTheme event, Emitter<ThemeState> emit) {
    AppThemes.darkMode = event.darkMode;
    emit(ThemeStateChanged(darkMode: event.darkMode));
  }
}
