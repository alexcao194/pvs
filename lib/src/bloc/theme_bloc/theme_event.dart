part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent({required this.darkMode});

  final bool darkMode;

  @override
  List<Object> get props => [darkMode];
}

class ThemeEventChangeTheme extends ThemeEvent {
  const ThemeEventChangeTheme({required super.darkMode});
}
