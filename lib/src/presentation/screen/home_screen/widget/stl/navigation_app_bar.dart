import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';

import 'bottom_bar_item.dart';

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
    return BottomAppBar(
      color: AppThemes.theme.backgroundColor,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomBarItem(
            label: 'study',
            icon: Icons.list,
            page: 0,
            pageController: pageController,
          ),
          BottomBarItem(
            label: 'study',
            icon: Icons.ad_units,
            page: 1,
            pageController: pageController,
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          BottomBarItem(
            label: 'study',
            icon: Icons.book,
            page: 3,
            pageController: pageController,
          ),
          BottomBarItem(
            label: 'study',
            icon: Icons.settings,
            page: 4,
            pageController: pageController,
          ),
        ],
      ),
    );
  }
}