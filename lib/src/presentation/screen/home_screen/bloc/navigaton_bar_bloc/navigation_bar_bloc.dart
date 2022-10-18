import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_bar_event.dart';
part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState>{
  NavigationBarBloc() : super(const NavigationBarInitial(currentPage: 0)) {
    on<NavigationBarEventChangePage>(_onChangePage);
  }


  FutureOr<void> _onChangePage(NavigationBarEventChangePage event, Emitter<NavigationBarState> emit) {
    event.pageController.animateToPage(event.pickedPage, duration: const Duration(milliseconds: 300), curve: Curves.bounceOut);
    emit(NavigationBarStatePageChanged(currentPage: event.pickedPage));
  }
}
