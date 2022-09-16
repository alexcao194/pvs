import 'package:flutter/material.dart';
import 'package:pvs/src/constant/app_path.dart';
import 'package:alex_core/alex_core.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.3,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20.0)),
                child: Image.asset(AppPath.a2Background, fit: BoxFit.fitHeight),
              )
          ),
          const SizedBox(height: 32.0),
          SizedBox(height: size.height * 0.1),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                TextField(
                  cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      label: const Text('Mã Sinh Viên')
                    ),
                  ),
                const SizedBox(height: 16.0),
                TextField(
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      label: const Text('Mã Sinh Viên')
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                InkWellButton(
                  height: 40,
                  width: 100,
                  radius: 2.0,
                  primaryColor: Theme.of(context).primaryColor,
                  onTap: () {},
                  child: Text(
                      'Đăng nhập',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
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
