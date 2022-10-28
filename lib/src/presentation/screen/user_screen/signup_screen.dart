
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/screen/user_screen/widget/stl/auth_button.dart';
import 'package:pvs/src/presentation/screen/user_screen/widget/stl/auth_input.dart';
import 'package:pvs/src/presentation/screen/user_screen/widget/stl/template.dart';
import 'package:pvs/src/service/app_router.dart';

import '../../../config/theme.dart';
import 'bloc/user_bloc/user_bloc.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(child: BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          return Stack(
            children: [
              Template(label: 'Đăng kí', children: [
                SizedBox(height: size.height * 0.01),
                if(userState is UserStateSignUpFail) Text(userState.error, style: AppThemes.theme.userErrorStyle),
                if(userState is UserStateSignUpSuccessful) Text(userState.status, style: AppThemes.theme.userStatusStyle),
                SizedBox(height: size.height * 0.01),
                AuthInput(
                    controller: idController,
                    icon: Icons.person,
                    label: 'Mã sinh viên'),
                SizedBox(height: size.height * 0.02),
                AuthInput(
                    controller: passwordController,
                    obscureText: true,
                    icon: Icons.lock,
                    label: 'Mật khẩu'),
                SizedBox(height: size.height * 0.02),
                AuthInput(
                    controller: rePasswordController,
                    obscureText: true,
                    icon: Icons.lock,
                    label: 'Nhập lại mật khẩu'),
                SizedBox(height: size.height * 0.02),
                AuthInput(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email,
                    label: 'Email'),
                SizedBox(height: size.height * 0.02),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Expanded(
                          child: AuthButton(
                            label: 'Đăng kí',
                            onTap: () {
                              BlocProvider.of<UserBloc>(context).add(
                                  UserEventSignup(
                                      id: idController.value.text.toUpperCase(),
                                      password: passwordController.value.text,
                                      email: emailController.value.text.toLowerCase(),
                                      rePassword: rePasswordController.value.text
                                  )
                              );
                            },
                          )),
                      const SizedBox(width: 8.0),
                      Expanded(
                          child: AuthButton(
                            label: 'Hủy',
                            onTap: () {
                              AppRouter.navigatorKey.currentState?.pop();
                            },
                          ))
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.2),
              ])
            ],
          );
        },
      )),
    );
  }
}
