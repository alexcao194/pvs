import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/bloc/quiz_bloc.dart';

import '../../../../bloc/lessons_bloc/lessons_bloc.dart';
import 'header_drawer.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<LessonsBloc, LessonsState>(
      builder: (context, lessonsState) {
        return Drawer(
          backgroundColor: AppThemes.theme.backgroundColor,
          child: Stack(
            children: [
              Column(
                children: buildTitle(lessonsState, size, context)
              ),
              const HeaderDrawer()
            ],
          ),
        );
      },
    );
  }

  List<Widget> buildTitle(LessonsState lessonsState, Size size, BuildContext context) {
    List<Widget> outcome = [SizedBox(height: size.height * 0.25)];
    for (int i = 0; i < lessonsState.totalLesson; i++) {
      outcome.add(
          GestureDetector(
            onTap: lessonsState.currentLesson > i ? () {
              BlocProvider.of<QuizBloc>(context).add(QuizEventGetQuestion(lesson: 'lesson_${i + 1}'));
              BlocProvider.of<LessonsBloc>(context).add(LessonsEventChange(pickedLesson: i + 1, state: lessonsState));
            } : null,
            child: Container(
              color: lessonsState.pickedLesson == i + 1 ? Colors.black12 : Colors.transparent,
              child: ListTile(
                title: Text(lessonsState.lessons[i],
                    style: lessonsState.currentLesson <= i
                        ? AppThemes.theme.titleDrawerDisableStyle
                        : AppThemes.theme.titleDrawerEnableStyle
                    )
              ),
            ),
          )
      );
    }
    return outcome;
  }
}
