part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState({required this.darkMode});

  final bool darkMode;

  @override
  List<Object> get props => [darkMode];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial({required super.darkMode});
}

class ThemeStateChanged extends ThemeState {
  const ThemeStateChanged({required super.darkMode});
}
