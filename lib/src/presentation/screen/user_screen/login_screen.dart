import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/screen/user_screen/common/auth_input.dart';
import 'package:pvs/src/presentation/screen/user_screen/common/template.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/shared_preferences.dart';
import 'bloc/user_bloc/user_bloc.dart';
import 'common/auth_button.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if(!Prefs.hasGet) {
      idController.text = Prefs.get('id');
      passwordController.text = Prefs.get('password');
    }
    var size = MediaQuery.of(context).size;
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return Stack(
          children: [
            Template(label: 'Đăng nhập', children: [
              AuthInput(
                controller: idController,
                icon: Icons.person,
                label: 'Mã Sinh Viên',
                onTap: () {
                  Prefs.hasGet = true;
                },
              ),
              SizedBox(height: size.height * 0.02),
              AuthInput(
                controller: passwordController,
                obscureText: true,
                icon: Icons.lock,
                label: 'Mật khẩu',
                onTap: () {
                  Prefs.hasGet = true;
                },
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
                onTap: (){
                  Prefs.set('id', idController.value.text.toUpperCase());
                  Prefs.set('password', passwordController.value.text);
                  BlocProvider.of<UserBloc>(context).add(UserEventLogin(
                      password: passwordController.value.text.toUpperCase(),
                      id: idController.value.text,
                      context: context));
                },
              ),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                height: size.height * 0.05,
                child: Text(
                    userState is UserStateLoginFail ? userState.error : "",
                    style: AppThemes.theme.userErrorStyle,
                maxLines: 2),
              ),
              SizedBox(height: size.height * 0.12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Chưa có tài khoản? ',
                      style: AppThemes.theme.haveNoAccountStyle),
                  GestureDetector(
                    child:
                    Text('Đăng kí', style: AppThemes.theme.signupStyle),
                    onTap: () {
                      AppRouter.navigatorKey.currentState
                          ?.pushNamed(AppRoutes.signUp);
                    },
                  )
                ],
              )
            ]),
            userState is UserStateLoading
                ? Container(
              color: AppThemes.theme.loadingBackground,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
                : const SizedBox(),
          ],
        );
      },
    );
  }

}
