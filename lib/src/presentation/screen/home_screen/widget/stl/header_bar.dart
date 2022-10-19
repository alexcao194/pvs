import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';

class HeaderBar extends StatefulWidget {
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
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {

  bool isActive = false;
  bool isShowing = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          if(isActive) isShowing = !isShowing;
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
                  if(isActive) isShowing = !isShowing;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if(isShowing) GestureDetector(
                      onTap: widget.leadingOnPress,
                      child: SizedBox(
                          height: size.width * 0.07,
                          width: size.width * 0.07,
                          child: widget.leading ?? const SizedBox()),
                    ),
                    if(isShowing) Text(widget.title ?? '',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
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
