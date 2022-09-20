import 'package:flutter/material.dart';

class AppThemes {
  static AppTheme get theme => const AppTheme(
    buttonBackgroundColor: Colors.white,
    primaryColor: Colors.red,
    disableColor: Colors.black12,
    fillTextInputColor: Color.fromARGB(25, 255, 0, 0),
    lessonButtonStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
    idStudentStyle: TextStyle(color: Colors.white54),
    displayNameStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
    titleDrawerEnableStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
    titleDrawerDisableStyle: TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),
    headerTitleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
    forgotPasswordStyle: TextStyle(decoration: TextDecoration.underline),
    signupStyle: TextStyle(color: Colors.redAccent),
    labelAuthButton: TextStyle(color: Colors.grey, fontSize: 14.0, fontWeight: FontWeight.w600)
  );
}

class AppTheme {
  final TextStyle displayNameStyle;
  final TextStyle idStudentStyle;
  final TextStyle titleDrawerEnableStyle;
  final TextStyle titleDrawerDisableStyle;
  final TextStyle headerTitleStyle;
  final TextStyle lessonButtonStyle;
  final TextStyle forgotPasswordStyle;
  final TextStyle signupStyle;
  final TextStyle labelAuthButton;

  final Color primaryColor;
  final Color buttonBackgroundColor;
  final Color disableColor;
  final Color fillTextInputColor;

  const AppTheme(
      {required this.buttonBackgroundColor,
      required this.primaryColor,
      required this.idStudentStyle,
      required this.displayNameStyle,
      required this.titleDrawerEnableStyle,
      required this.titleDrawerDisableStyle,
      required this.disableColor,
      required this.headerTitleStyle,
      required this.lessonButtonStyle,
      required this.fillTextInputColor,
      required this.forgotPasswordStyle,
      required this.signupStyle,
      required this.labelAuthButton
      });
}
