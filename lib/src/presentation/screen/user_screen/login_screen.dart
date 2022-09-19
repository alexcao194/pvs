import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/constant/app_path.dart';
import 'package:pvs/src/presentation/screen/user_screen/common/auth_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var focusNode = FocusNode();
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height * 0.3,
            child: Image.asset(AppPath.a2Background, fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.25),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                    height: size.height * 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          const Text('Đăng nhập'),
                          const SizedBox(height: 24.0),
                          const AuthInput(
                            icon: Icons.person,
                            label: 'Mã sinh viên',
                            autoFocus: true,

                          ),
                          const SizedBox(height: 16.0),
                          AuthInput(
                            focusNode: focusNode,
                            icon: Icons.lock,
                            label: 'Password',
                            obscureText: true,
                          ),
                          const SizedBox(height: 16.0),
                          AuthButton()
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40.0),
      child: Material(
        child: InkWell(
          splashColor: AppThemes.theme.primaryColor,
          onTap: () {},
          child: Container(
            height: 45,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(width: 1.5, color: AppThemes.theme.primaryColor)
            ),
            child: const Center(child: Text('Đăng nhập')),
          ),
        ),
      ),
    );
  }
}


