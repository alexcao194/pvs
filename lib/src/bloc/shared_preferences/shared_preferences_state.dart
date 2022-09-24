part of 'shared_preferences_bloc.dart';

abstract class SharedPreferencesState extends Equatable {
  const SharedPreferencesState();
}

class SharedPreferencesInitial extends SharedPreferencesState {
  @override
  List<Object> get props => [];
}
