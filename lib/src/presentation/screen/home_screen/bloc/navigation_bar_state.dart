part of 'navigation_bar_bloc.dart';

abstract class NavigationBarState extends Equatable {
  const NavigationBarState({required this.currentPage});

  final int currentPage;

  @override
  List<Object?> get props => [currentPage];
}

class NavigationBarInitial extends NavigationBarState {
  const NavigationBarInitial({required super.currentPage});
}

class NavigationBarStatePageChanged extends NavigationBarState {
  const NavigationBarStatePageChanged({required super.currentPage});
}