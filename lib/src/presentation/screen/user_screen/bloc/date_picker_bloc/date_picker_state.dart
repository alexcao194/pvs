part of 'date_picker_bloc.dart';

abstract class DatePickerState extends Equatable {
  const DatePickerState({required this.time});
  final DateTime time;

  @override
  List<Object> get props => [time];
}

class DatePickerInitial extends DatePickerState {
  const DatePickerInitial({required super.time});
}

class DatePickerStateDone extends DatePickerState {
  const DatePickerStateDone({required super.time});
}

class DatePickerStateFail extends DatePickerState {
  final String error;
  const DatePickerStateFail({required this.error,required super.time});

  @override
  List<Object> get props => [error, time];
}