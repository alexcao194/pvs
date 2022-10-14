
import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/user_screen/widget/stl/auth_button.dart';
import 'package:pvs/src/presentation/screen/user_screen/widget/stl/auth_input.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/http.dart';

class ConnectScreen extends StatelessWidget {
  ConnectScreen({Key? key}) : super(key: key);
  final TextEditingController ipController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthInput(
              controller: ipController,
              icon: Icons.key_outlined,
              label: 'Địa chỉ IP4',
            ),
            const SizedBox(height: 16),
            AuthButton(
              label: 'Get IP',
              onTap: () {
                HTTP.ip4 = ipController.value.text;
                AppRouter.navigatorKey.currentState?.pushNamed(AppRoutes.login);
              },
            )
          ],
        ),
      ),
    );
  }
}
