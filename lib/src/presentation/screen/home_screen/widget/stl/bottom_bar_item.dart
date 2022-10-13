import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/bloc/navigaton_bar_bloc/navigation_bar_bloc.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(
      {Key? key,
      required this.label,
      required this.icon,
      required this.page,
      required this.pageController})
      : super(key: key);

  final String label;
  final IconData icon;
  final int page;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
        builder: (context, navigationBarState) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<NavigationBarBloc>(context).add(
                  NavigationBarEventChangePage(
                      pickedPage: page, controller: pageController));
            },
            child: SizedBox(
              height: size.height * 0.09,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    SizedBox(
                        height: size.height * 0.04,
                        child: Icon(
                          icon,
                          size: 28,
                          color: (navigationBarState.currentPage == page)
                              ? AppThemes.theme.primaryColor
                              : AppThemes.theme.bottomBarIconColor,
                        )),
                    Text(label)
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
