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
          Expanded(
            child: BottomBarItem(
              label: 'Kiến thức',
              icon: Icons.home,
              page: 0,
              pageController: pageController,
            ),
          ),
          Expanded(
            child: BottomBarItem(
              label: 'Bài tập',
              icon: Icons.list_alt,
              page: 1,
              pageController: pageController,
            ),
          ),
          SizedBox(
            width: size.width * 0.1,
          ),
          Expanded(
            child: BottomBarItem(
              label: 'Trắc nghiệm',
              icon: Icons.book,
              page: 3,
              pageController: pageController,
            ),
          ),
          Expanded(
            child: BottomBarItem(
              label: 'Kiểm tra',
              icon: Icons.featured_play_list_sharp,
              page: 4,
              pageController: pageController,
            ),
          ),
        ],
      ),
    );
  }
}