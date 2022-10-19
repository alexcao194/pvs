import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pvs/src/constant/app_path.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/settings_page/widget/stf/settings_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Text('Hi Đức,', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Settings', style: TextStyle(fontSize: 16, color: Colors.black26)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SettingsButton(title: 'Dark mode', description: 'Turn on dark mode', iconData: Icons.ac_unit_outlined),
              SettingsButton(title: 'Nav Style', description: 'Change navigation bar style', iconData: Icons.access_time)
            ],
          )
        ],
      ),
    );
  }
}


