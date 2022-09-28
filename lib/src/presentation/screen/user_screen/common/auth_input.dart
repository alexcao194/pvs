import 'package:flutter/material.dart';
import 'package:pvs/src/service/shared_preferences.dart';

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
        this.controller,
        this.borderRadius,
        this.enable,
        this.keyboardType
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
  final double? borderRadius;
  final bool? enable;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 20.0),
      child: TextField(
        cursorColor: AppThemes.theme.primaryColor,
        controller: controller,
        focusNode: focusNode,
        autofocus: autoFocus ?? false,
        obscureText: obscureText ?? false,
        onSubmitted: onSubmitted,
        enabled: enable,
        onTap: onTap,
        keyboardType: keyboardType,
        style: AppThemes.theme.labelAuthInputStyle,
        decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppThemes.theme.primaryColor),
            border: InputBorder.none,
            fillColor: AppThemes.theme.fillTextInputColor,
            filled: true,
            hintText: label,
            hintStyle: AppThemes.theme.labelAuthInputStyle,
            errorText: error,
            isCollapsed: false),
      ),
    );
  }
}
