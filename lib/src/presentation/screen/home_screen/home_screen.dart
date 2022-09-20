import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/screen/home_screen/bloc/navigation_bar_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/widget/stf/keep_alive_page.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../constant/app_path.dart';
import 'widget/stl/app_drawer.dart';
import 'widget/stl/header_bar.dart';
import 'widget/stl/navigation_app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
        builder: (context, navigationBarState) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: const AppDrawer(),
        body: Column(
          children: [
            HeaderBar(
              height: size.height * 0.1,
              title: 'Hello World',
              leading: CircleAvatar(
                radius: 20.0,
                backgroundColor: AppThemes.theme.buttonBackgroundColor,
                child: Text(
                  '1',
                  style: AppThemes.theme.lessonButtonStyle,
                ),
              ),
              action: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                    color: Colors.white,
                    child: Image.asset(AppPath.profile, fit: BoxFit.cover)),
              ),
              leadingOnPress: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            SizedBox(
              height: size.height * 0.81,
              child: PageView.builder(
                  itemCount: 5,
                  controller: pageController,
                  onPageChanged: (id) {
                    BlocProvider.of<NavigationBarBloc>(context)
                        .add(NavigationBarEventChangePage(pickedPage: id));
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return const KeepAlivePage(
                        child: WebView(
                          javascriptMode: JavascriptMode.unrestricted,
                          initialUrl: 'https://itptit.com/dashboard/problems/100273',
                        )
                    );
                  }),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppThemes.theme.primaryColor,
          onPressed: () {
            BlocProvider.of<NavigationBarBloc>(context)
                .add(
                  NavigationBarEventChangePage(
                      pickedPage: 2,
                      controller: pageController
                  )
            );
          },
          child: const Icon(Icons.home),
        ),
        bottomNavigationBar: NavigationAppBar(pageController: pageController, size: size),
      );
    });
  }
}
