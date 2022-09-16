import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar(
      {Key? key,
      this.title,
      this.actionOnPress,
      this.leadingOnPress,
      this.action,
      this.leading,
      this.height})
      : super(key: key);

  final VoidCallback? leadingOnPress;
  final VoidCallback? actionOnPress;
  final String? title;
  final Widget? leading;
  final Widget? action;
  final double? height;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      height: height,
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          SizedBox(
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
                  Text(title ?? '', style: Theme.of(context).textTheme.caption),
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
        ],
      ),
    );
  }
}
