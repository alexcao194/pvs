part of 'drop_menu_bloc.dart';

abstract class DropMenuEvent extends Equatable {
  const DropMenuEvent();
}

class DropMenuEventChange extends DropMenuEvent {
  const DropMenuEventChange({required this.value});

  final int value;

  @override
  List<Object> get props => [value];
}