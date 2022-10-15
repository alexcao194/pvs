import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/header_button.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/quiz_page/widget/stl/progress_bar.dart';
import 'package:pvs/src/service/app_router.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      children: [
        HeaderButton(
          child: const Icon(Icons.arrow_back, color: Colors.white),
          onTap: () {
            AppRouter.navigatorKey.currentState?.pop();
          },
        ),
        const SizedBox(width: 8.0),
        const HeaderButton(
          child: Icon(Icons.settings, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: 2.0, height: size.width * 0.11 - 3, color: Colors.white24),
        ),
        const HeaderButton(
            child: Text('3/60',
                style: TextStyle(color: Colors.white, fontSize: 18))),
        Expanded(
            child: GestureDetector(
                onTap: () {
                  AppRouter.navigatorKey.currentState?.pushNamed(AppRoutes.rank);
                },
                child: const ProgressBar(
                    count: 1243465, end: Icon(Icons.control_point))))
      ],
    );
  }
}
