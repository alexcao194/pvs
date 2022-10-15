import 'package:alex_core/alex_core.dart';
import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({Key? key, required this.child, this.onTap}) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWellButton(
      width: size.width * 0.11,
      height: size.width * 0.1,
      radius: 5.0,
      isActive: true,
      borderWidth: 0,
      backgroundColor: Colors.white24,
      primaryColor: Colors.white24,
      onTap: onTap ?? () {},
      child: child,
    );
  }
}
