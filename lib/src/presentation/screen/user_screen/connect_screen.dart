import 'package:flutter/material.dart';
import 'package:pvs/src/presentation/screen/user_screen/widget/stl/auth_button.dart';
import 'package:pvs/src/presentation/screen/user_screen/widget/stl/auth_input.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/shared_preferences.dart';

class ConnectScreen extends StatelessWidget {
  ConnectScreen({Key? key}) : super(key: key);
  final TextEditingController ipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String ip4 = Prefs.get('ip4');
    ipController.text = ip4.replaceAll(RegExp(r':1904'), '');
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
                Prefs.set('ip4', '${ipController.value.text}:1904');
                AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.splash);
              },
            )
          ],
        ),
      ),
    );
  }
}
