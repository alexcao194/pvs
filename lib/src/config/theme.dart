import 'package:flutter/material.dart';

class AppThemes {
  static bool darkMode = false;
  static AppTheme _theme(int r, int g, int b, bool darkMode) {
    switch(darkMode) {
      case true:
        return AppTheme(
          buttonBackgroundColor: const Color.fromARGB(255, 79, 79, 79),
          primaryColor: Color.fromARGB(255, r, g, b),
          disableColor: Colors.black12,
          bottomBarIconColor: Colors.white24,
          backgroundColor: const Color.fromARGB(255, 59, 59, 59),
          fillTextInputColor: Color.fromARGB(25, r, g, b),
          lessonButtonStyle: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          idStudentStyle: const TextStyle(color: Colors.black45),
          displayNameStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          titleDrawerEnableStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          titleDrawerDisableStyle: const TextStyle(color: Colors.white54, fontWeight: FontWeight.w600),
          headerTitleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          forgotPasswordStyle: const TextStyle(color: Colors.white, decoration: TextDecoration.underline),
          signupStyle: TextStyle(color: Color.fromARGB(255, r, g, b)),
          labelAuthButtonStyle: const TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600),
          profileDisplayNameStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 26.0),
          profileIdStyle: const TextStyle(color: Colors.white54, fontWeight: FontWeight.w600, fontSize: 14.0),
          labelAuthInputStyle: const TextStyle(color: Colors.white70),
          titleUserScreenStyle: const TextStyle(color: Colors.white),
          haveNoAccountStyle: const TextStyle(color: Colors.white),
          countProcessStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)
        );
      default:
        return AppTheme(
          buttonBackgroundColor: Colors.white,
          primaryColor: Color.fromARGB(255, r, g, b),
          disableColor: Colors.black12,
          backgroundColor: Colors.white,
          bottomBarIconColor: Colors.black12,
          fillTextInputColor: Color.fromARGB(25, r, g, b),
          lessonButtonStyle: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          idStudentStyle: const TextStyle(color: Colors.black45),
          displayNameStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          titleDrawerEnableStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          titleDrawerDisableStyle: const TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),
          headerTitleStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          forgotPasswordStyle: const TextStyle(decoration: TextDecoration.underline),
          signupStyle: TextStyle(color: Color.fromARGB(255, r, g, b)),
          labelAuthButtonStyle: const TextStyle(color: Colors.grey, fontSize: 14.0, fontWeight: FontWeight.w600),
          profileDisplayNameStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 26.0),
          profileIdStyle: const TextStyle(color: Colors.black45, fontWeight: FontWeight.w600, fontSize: 14.0),
          labelAuthInputStyle: const TextStyle(color: Colors.black),
          titleUserScreenStyle: const TextStyle(color: Colors.black),
          haveNoAccountStyle: const TextStyle(color: Colors.black),
          countProcessStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600)
        );
    }
  }
  static AppTheme get theme => _theme(158, 452, 545, darkMode);
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
  final TextStyle labelAuthButtonStyle;
  final TextStyle profileDisplayNameStyle;
  final TextStyle profileIdStyle;
  final TextStyle labelAuthInputStyle;
  final TextStyle titleUserScreenStyle;
  final TextStyle haveNoAccountStyle;
  final TextStyle countProcessStyle;

  final Color primaryColor;
  final Color buttonBackgroundColor;
  final Color disableColor;
  final Color fillTextInputColor;
  final Color backgroundColor;
  final Color bottomBarIconColor;

  const AppTheme({
    required this.buttonBackgroundColor,
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
    required this.labelAuthButtonStyle,
    required this.profileDisplayNameStyle,
    required this.profileIdStyle,
    required this.backgroundColor,
    required this.labelAuthInputStyle,
    required this.titleUserScreenStyle,
    required this.haveNoAccountStyle,
    required this.countProcessStyle,
    required this.bottomBarIconColor
    });
}
