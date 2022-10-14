import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/header_button.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/progress_bar.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Row(
      children: [
        const HeaderButton(
          child: Icon(Icons.account_balance_sharp,
              color: Colors.white),
        ),
        const SizedBox(width: 8.0),
        const HeaderButton(
          child: Icon(Icons.settings, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: 2.0,
              height: size.width * 0.11 - 3,
              color: AppThemes.theme.quizButtonColor),
        ),
        const HeaderButton(
            child: Text('3/6',
                style:
                TextStyle(color: Colors.white, fontSize: 20))),
        const ProgressBar(count: 1243465, end: Icon(Icons.control_point))
      ],
    );
  }
}