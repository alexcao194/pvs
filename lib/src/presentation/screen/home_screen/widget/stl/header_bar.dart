import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar(
      {Key? key,
      this.title,
      this.actionOnPress,
      this.leadingOnPress,
      this.action,
      this.leading,
      this.backgroundColor})
      : super(key: key);

  final VoidCallback? leadingOnPress;
  final VoidCallback? actionOnPress;
  final String? title;
  final Widget? leading;
  final Widget? action;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: backgroundColor ?? AppThemes.theme.primaryColor,
        ),
        child:           SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: leadingOnPress,
                  child: SizedBox(
                      height: size.height * 0.05,
                      width: size.height * 0.05,
                      child: leading ?? const SizedBox()),
                ),
                Text(title ?? '', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                GestureDetector(
                  onTap: actionOnPress,
                  child: SizedBox(
                      height: size.height * 0.05,
                      width: size.height * 0.05,
                      child: action ?? const SizedBox()),
                ),
              ],
            ),
          ),
        )
        ,
      ),
    );
  }
}
