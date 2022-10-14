import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/has_image_question.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/header_bar.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/bottom_bar.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: double.maxFinite,
                        color: AppThemes.theme.primaryColor50,
                        child: const HasImageQuestionSingleChoice()
                      ),
                    ),
                  ),
                ),
                const BottomBar()
              ],
            ),
          ),
        ));
  }
}



class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: AppThemes.theme.primaryColor,
    ));
  }
}
