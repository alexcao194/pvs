import 'package:flutter/material.dart';

import '../../../../config/theme.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.label,
    this.onTap
  }) : super(key: key);

  final VoidCallback? onTap;
  final String label;


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40.0),
      child: Material(
        child: InkWell(
          splashColor: AppThemes.theme.primaryColor,
          onTap: onTap,
          child: Container(
            height: 45,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(40.0),
                border: Border.all(width: 1.5, color: AppThemes.theme.primaryColor)
            ),
            child: Center(child: Text(label, style: AppThemes.theme.labelAuthButton)),
          ),
        ),
      ),
    );
  }
}
