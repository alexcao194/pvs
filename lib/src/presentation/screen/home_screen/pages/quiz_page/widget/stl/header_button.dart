import 'package:alex_core/alex_core.dart';
import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWellButton(
      width: size.width * 0.11,
      height: size.width * 0.11,
      radius: 5.0,
      isActive: true,
      backgroundColor: AppThemes.theme.quizButtonColor,
      primaryColor: AppThemes.theme.quizButtonColor,
      onTap: () {},
      child: child,
    );
  }
}
