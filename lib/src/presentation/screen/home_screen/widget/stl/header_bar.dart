import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';

enum HeaderType {
  dynamic,
  full
}

class DynamicHeaderBar extends StatefulWidget {
  const DynamicHeaderBar(
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
  final Widget? title;
  final Widget? leading;
  final Widget? action;
  final Color? backgroundColor;

  @override
  State<DynamicHeaderBar> createState() => _DynamicHeaderBarState();
}

class _DynamicHeaderBarState extends State<DynamicHeaderBar> {
  bool isActive = false;
  bool isShowing = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isActive) isShowing = !isShowing;
          isActive = !isActive;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedContainer(
              onEnd: () {
                setState(() {
                  if (isActive) isShowing = !isShowing;
                });
              },
              width: isActive ? size.width * 0.75 : size.width * 0.11,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: widget.backgroundColor ?? AppThemes.theme.primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.02),
                child: Row(
                  mainAxisAlignment: isShowing ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
                  children: [
                    if (isShowing)
                      GestureDetector(
                        onTap: widget.leadingOnPress,
                        child: SizedBox(
                            height: size.width * 0.07,
                            width: size.width * 0.07,
                            child: widget.leading ?? const SizedBox()),
                      ),
                    if (isShowing)
                      widget.title ?? const SizedBox(),
                    GestureDetector(
                      onTap: isActive ? widget.actionOnPress : null,
                      child: SizedBox(
                          height: size.width * 0.07,
                          width: size.width * 0.07,
                          child: widget.action ?? const SizedBox()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FullHeaderBar extends StatelessWidget {
  const FullHeaderBar(
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
  final Widget? title;
  final Widget? leading;
  final Widget? action;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppThemes.theme.primaryColor,
      ),
      height: size.height * 0.08,
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
                  title?? const SizedBox(),
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

class HeaderBar extends StatelessWidget {
  const HeaderBar({Key? key, required this.headerType, this.leadingOnPress, this.actionOnPress, this.title, this.leading, this.action, this.backgroundColor}) : super(key: key);

  final HeaderType headerType;
  final VoidCallback? leadingOnPress;
  final VoidCallback? actionOnPress;
  final Widget? title;
  final Widget? leading;
  final Widget? action;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    switch(headerType) {
      case HeaderType.dynamic:
        return DynamicHeaderBar(
          title: title,
          leading: leading,
          leadingOnPress: leadingOnPress,
          action: action,
          actionOnPress: actionOnPress,
          backgroundColor: backgroundColor,
        );
      case HeaderType.full:
        return FullHeaderBar(
          title: title,
          leading: leading,
          leadingOnPress: leadingOnPress,
          action: action,
          actionOnPress: actionOnPress,
          backgroundColor: backgroundColor,
        );
    }
  }
}

