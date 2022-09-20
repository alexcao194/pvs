import 'package:flutter/material.dart';

import '../../../../config/theme.dart';

class AuthInput extends StatelessWidget {
  const AuthInput(
      {Key? key,
        required this.icon,
        required this.label,
        this.autoFocus,
        this.focusNode,
        this.obscureText,
        this.onSubmitted,
        this.onTap,
        this.error,
        this.controller
      })
      : super(key: key);

  final String label;
  final String? error;
  final IconData icon;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final bool? obscureText;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: TextField(
        cursorColor: AppThemes.theme.primaryColor,
        controller: controller,
        focusNode: focusNode,
        autofocus: autoFocus ?? false,
        obscureText: obscureText ?? false,
        onSubmitted: onSubmitted,
        onTap: onTap,
        decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppThemes.theme.primaryColor),
            border: InputBorder.none,
            fillColor: AppThemes.theme.fillTextInputColor,
            filled: true,
            hintText: label,
            errorText: error,
            isCollapsed: false),
      ),
    );
  }
}
