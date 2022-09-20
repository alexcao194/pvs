import 'package:flutter/material.dart';

import 'header_drawer.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Drawer(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.25),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne')),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
                const ListTile(title: Text('Tiêu đề ne'), enabled: false),
              ],
            ),
          ),
          const HeaderDrawer()
        ],
      ),
    );
  }
}

