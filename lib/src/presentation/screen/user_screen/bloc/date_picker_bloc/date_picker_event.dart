part of 'date_picker_bloc.dart';

abstract class DatePickerEvent extends Equatable {
  const DatePickerEvent();
}

class DatePickerEventOnPick extends DatePickerEvent {
  final DateTime currentTime;
  final BuildContext context;
  const DatePickerEventOnPick({required this.currentTime, required this.context});

  @override
  List<Object> get props => [currentTime];
}