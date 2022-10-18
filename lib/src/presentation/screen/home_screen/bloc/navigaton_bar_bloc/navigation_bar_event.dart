part of 'navigation_bar_bloc.dart';
abstract class NavigationBarEvent extends Equatable {
  const NavigationBarEvent();
}

class NavigationBarEventChangePage extends NavigationBarEvent {
  const NavigationBarEventChangePage({required this.pickedPage, required this.pageController});

  final int pickedPage;
  final PageController pageController;

  @override
  List<Object?> get props => [pickedPage, pageController];
}