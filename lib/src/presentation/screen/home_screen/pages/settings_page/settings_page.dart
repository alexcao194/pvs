import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/settings_page/widget/stf/settings_button.dart';
import 'package:pvs/src/presentation/screen/user_screen/bloc/user_bloc/user_bloc.dart';

import '../../../../bloc/data_bloc/data_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, dataState) {
        return Padding(
          padding: const EdgeInsets.all(8.0) + const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text('Chào ${dataState.user.displayName},', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Cài đặt', style: TextStyle(fontSize: 16, color: Colors.black26)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SettingsButton(title: 'Chế độ tối', description: 'Bật/tắt chế độ tối', iconData: Icons.ac_unit_outlined),
                  SettingsButton(title: 'Vùng đầu trang', description: 'Thay đổi kiểu thanh trạng thái', iconData: Icons.access_time)
                ],
              ),
              CupertinoButton(child: const Text('Đăng xuất', style: TextStyle(color: Colors.red)), onPressed: () {
                BlocProvider.of<UserBloc>(context).add(const UserEventLogout());
              })
            ],
          ),
        );
      },
    );
  }
}


