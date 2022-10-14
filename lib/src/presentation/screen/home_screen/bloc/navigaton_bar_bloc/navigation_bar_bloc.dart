import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pvs/src/service/app_router.dart';

part 'navigation_bar_event.dart';
part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState>{
  NavigationBarBloc() : super(const NavigationBarInitial(currentPage: 0)) {
    on<NavigationBarEventChangePage>(_onChangePage);
  }


  FutureOr<void> _onChangePage(NavigationBarEventChangePage event, Emitter<NavigationBarState> emit) {
    if(event.pickedPage == 3) {
      AppRouter.navigatorKey.currentState?.pushNamed(AppRoutes.quiz);
    } else {
      emit(NavigationBarStatePageChanged(currentPage: event.pickedPage));
    }
  }
}
