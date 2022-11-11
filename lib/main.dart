import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/bloc/data_bloc/data_bloc.dart';
import 'package:pvs/src/presentation/bloc/lessons_bloc/lessons_bloc.dart';
import 'package:pvs/src/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/bloc/navigaton_bar_bloc/navigation_bar_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/bloc/quiz_bloc/quiz_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/quiz_screen/bloc/quiz_result_bloc/quiz_result_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/test_page/bloc/test_bloc/test_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/test_page/bloc/test_infor_bloc/test_infor_bloc.dart';
import 'package:pvs/src/service/shared_preferences.dart';
import 'src/presentation/screen/user_screen/bloc/user_bloc/user_bloc.dart';
import 'src/service/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);
  Prefs.initial();
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => QuizBloc()),
          BlocProvider(create: (_) => NavigationBarBloc()),
          BlocProvider(create: (_) => ThemeBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => DataBloc()),
          BlocProvider(create: (_) => LessonsBloc()),
          BlocProvider(create: (_) => TestBloc()),
          BlocProvider(create: (_) => QuizResultBloc()),
          BlocProvider(create: (_) => TestInforBloc())
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
      theme: ThemeData(
        // fontFamily: AppFonts.primary
      ),
    );
  }
}

