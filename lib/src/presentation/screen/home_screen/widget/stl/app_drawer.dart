import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/config/theme.dart';

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
                children: buildTitle(lessonsState, size)
              ),
              const HeaderDrawer()
            ],
          ),
        );
      },
    );
  }

  List<Widget> buildTitle(LessonsState lessonsState, Size size) {
    List<Widget> outcome = [SizedBox(height: size.height * 0.25)];
    for (int i = 0; i < lessonsState.totalLesson; i++) {
      outcome.add(
          ListTile(
            title: Text(lessonsState.lessons[i],
                style: lessonsState.currentLesson <= i
                    ? AppThemes.theme.titleDrawerDisableStyle
                    : AppThemes.theme.titleDrawerEnableStyle
                )
          )
      );
    }
    return outcome;
  }
}
