import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/screen/home_screen/bloc/navigaton_bar_bloc/navigation_bar_bloc.dart';

class NavigationAppBar extends StatelessWidget {
  const NavigationAppBar({
    Key? key,
    required this.pageController,
    required this.size,
  }) : super(key: key);

  final PageController pageController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: AppThemes.theme.primaryColor,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.fastLinearToSlowEaseIn,
      animationDuration: const Duration(milliseconds: 300),
      onTap: (index) {
        BlocProvider.of<NavigationBarBloc>(context).add(NavigationBarEventChangePage(pickedPage: index, pageController: pageController));
      },
      items: const [
        CurvedNavigationBarItem(
          child: Icon(Icons.home, color: Colors.white),
          label: 'Kiến thức',
          labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)
        ),
        CurvedNavigationBarItem(
            child: Icon(Icons.ondemand_video, color: Colors.white),
            label: 'Video',
            labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)
        ),
        CurvedNavigationBarItem(
            child: Icon(Icons.task, color: Colors.white),
            label: 'Bài tập',
            labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)
        ),
        CurvedNavigationBarItem(
            child: Icon(Icons.control_point_duplicate, color: Colors.white),
            label: 'Kiểm tra',
            labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)
        ),
      ],
    );
  }
}