import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/home_screen/widget/stl/header_bar.dart';
import 'package:pvs/src/service/app_router.dart';

class QuestionHeaderBar extends StatelessWidget {
  const QuestionHeaderBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeaderBar(
      headerType: HeaderType.full,
      backgroundColor: Colors.white,
      leading: Row(
        children: const [Icon(Icons.heart_broken), Text('4')],
      ),
      title: Expanded(
        child: Container(
          height: 15,
          decoration: BoxDecoration(
              color: Colors.black26, borderRadius: BorderRadius.circular(20.0)),
          child: Stack(
            children: [
              Container(
                height: 15,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ],
          ),
        ),
      ),
      action: IconButton(
        icon: const Icon(Icons.cancel_outlined),
        onPressed: () {
          AppRouter.navigatorKey.currentState?.pop();
        },
      ),
    );
  }
}