import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/header_button.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/progress_bar.dart';


class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: size.height * 0.05,
              child: const ProgressBar(count: 12, end: Icon(Icons.timelapse, color: Colors.white))
          ),
        ),
        const SizedBox(width: 4.0),
        const HeaderButton(
            child: Icon(Icons.check, color: Colors.white),
        )
      ],
    );
  }
}
