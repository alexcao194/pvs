part of 'drop_menu_bloc.dart';

abstract class DropMenuState extends Equatable {
  const DropMenuState({required this.value});

  final int value;

  @override
  List<Object> get props => [value];
}

class DropMenuInitial extends DropMenuState {
  const DropMenuInitial({required super.value});
}

class DropMenuStateChanged extends DropMenuState {
  const DropMenuStateChanged({required super.value});
}
