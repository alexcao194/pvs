import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/screen/user_screen/common/auth_input.dart';
import 'package:pvs/src/presentation/screen/user_screen/common/template.dart';
import 'package:pvs/src/service/app_router.dart';

import '../../../bloc/user_bloc/user_bloc.dart';
import 'common/auth_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return Template(label: 'Đăng nhập', children: [
          const AuthInput(icon: Icons.person, label: 'Mã Sinh Viên'),
          SizedBox(height: size.height * 0.02),
          const AuthInput(
            icon: Icons.lock,
            label: 'Mật khẩu',
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            children: [
              const SizedBox(width: 16.0),
              GestureDetector(
                child: Text('Quên mât khẩu',
                    style: AppThemes.theme.forgotPasswordStyle),
                onTap: () {
                  AppRouter.navigatorKey.currentState
                      ?.pushNamed(AppRoutes.forgotPassword);
                },
              ),
              const Expanded(child: SizedBox())
            ],
          ),
          SizedBox(height: size.height * 0.02),
          AuthButton(
            label: 'Đăng nhập',
            onTap: () {
              BlocProvider.of<UserBloc>(context)
                  .add(
                  UserEventLogin(
                      password: passwordController.value.text,
                      id: idController.value.text
                  )
              );
            },
          ),
          SizedBox(height: size.height * 0.22),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Chưa có tài khoản? ',
                  style: AppThemes.theme.haveNoAccountStyle),
              GestureDetector(
                child: Text('Đăng kí', style: AppThemes.theme.signupStyle),
                onTap: () {
                  AppRouter.navigatorKey.currentState
                      ?.pushNamed(AppRoutes.registry);
                },
              )
            ],
          )
        ]);
      },
    );
  }
}
