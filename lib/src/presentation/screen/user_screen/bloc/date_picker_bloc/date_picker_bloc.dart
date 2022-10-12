import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'date_picker_event.dart';
part 'date_picker_state.dart';

class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {
  DatePickerBloc() : super(DatePickerInitial(time: DateTime.now())) {
    on<DatePickerEventOnPick>(_onPick);
    on<DatePickerEventReset>(_onReset);
  }

  FutureOr<void> _onPick(DatePickerEventOnPick event, Emitter<DatePickerState> emit) async {
    await showDatePicker(
        context: event.context,
        initialDate: state.time,
        firstDate: DateTime(1800),
    lastDate: DateTime(2025)
    ).then((value) => emit(DatePickerStateDone(time: value ?? state.time)));
  }

  FutureOr<void> _onReset(DatePickerEventReset event, Emitter<DatePickerState> emit) {
    emit(DatePickerInitial(time: DateTime.now()));
  }
}
