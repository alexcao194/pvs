import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/bloc/data_bloc/data_bloc.dart';
import 'package:pvs/src/bloc/theme_bloc/theme_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/bloc/navigaton_bar_bloc/navigation_bar_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/bloc/video_player_bloc/video_player_bloc.dart';
import 'package:pvs/src/presentation/screen/profile_screen/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:pvs/src/presentation/screen/user_screen/bloc/drop_menu_bloc/drop_menu_bloc.dart';
import 'package:pvs/src/service/shared_preferences.dart';
import 'src/presentation/screen/profile_screen/bloc/profile_bloc/profile_bloc.dart';
import 'src/presentation/screen/user_screen/bloc/user_bloc/user_bloc.dart';
import 'src/service/app_router.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  WidgetsFlutterBinding.ensureInitialized();
  Prefs.initial();
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => NavigationBarBloc()),
          BlocProvider(create: (_) => ProfileBloc()),
          BlocProvider(create: (_) => ThemeBloc()),
          BlocProvider(create: (_) => ImagePickerBloc()),
          BlocProvider(create: (_) => VideoPlayerBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => DataBloc()),
          BlocProvider(create: (_) => DropMenuBloc())
        ],
        child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PVS',
      onGenerateRoute: AppRouter.generateRoute,
      navigatorKey: AppRouter.navigatorKey,
    );
  }
}

