part of 'navigation_bar_bloc.dart';
abstract class NavigationBarEvent extends Equatable {
  const NavigationBarEvent();
}

class NavigationBarEventChangePage extends NavigationBarEvent {
  const NavigationBarEventChangePage({required this.pickedPage});

  final int pickedPage;

  @override
  List<Object?> get props => [pickedPage];
}