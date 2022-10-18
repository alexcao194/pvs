import 'package:flutter/material.dart';

import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/pages/quiz_page.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/pages/rank_page.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/header_bar.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/bottom_bar.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                const HeaderBar(),
                Expanded(
                  child: PageView(
                    children: const [
                      QuizPage(),
                      RankPage()
                    ],
                  ),
                ),
                const BottomBar()
              ],
            ),
          ),
        ));
  }
}
