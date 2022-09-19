import 'package:flutter/material.dart';

import '../../../../config/theme.dart';

class AuthInput extends StatelessWidget {
  const AuthInput(
      {Key? key,
      required this.icon,
      required this.label,
      this.autoFocus,
      this.focusNode,
      this.obscureText
      })
      : super(key: key);

  final String label;
  final IconData icon;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: TextField(
        cursorColor: AppThemes.theme.primaryColor,
        focusNode: focusNode,
        autofocus: autoFocus ?? false,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppThemes.theme.primaryColor),
            border: InputBorder.none,
            fillColor: AppThemes.theme.fillTextInputColor,
            filled: true,
            hintText: label,
            isCollapsed: false),
      ),
    );
  }
}
