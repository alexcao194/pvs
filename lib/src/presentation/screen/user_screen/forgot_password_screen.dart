import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/user_screen/common/auth_button.dart';
import 'package:pvs/src/presentation/screen/user_screen/common/auth_input.dart';
import 'package:pvs/src/presentation/screen/user_screen/common/template.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Template(
      label: 'Quên mật khẩu',
      children: [
        const AuthInput(
          icon: Icons.person,
          label: 'Mã Sinh Viên',
      ),
        SizedBox(height: size.height * 0.02),
        const AuthButton(label: 'Lấy mật khẩu')
      ],
    );
  }
}
