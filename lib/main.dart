import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radiohead/controllers/main_controller.dart';
import 'package:radiohead/screens/home_screen.dart';
import 'package:radiohead/screens/splash_screen.dart';
import 'package:radiohead/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Provider<MainController>(
      create: (_) => MainController(),
      child: MaterialApp(
          title: 'Radio Head',
          theme: ThemeData.dark(),
          initialRoute: '/',
          routes: {
            SplashScreen.ROUTE: (context) => Scaffold(body: SplashScreen()),
            HomeScreen.ROUTE: (context) => Scaffold(
                  appBar: _getAppBar(),
                  body: SafeArea(child: HomeScreen()),
                ),
          }),
    );
  }
}

Widget _getAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(Constants.APP_BAR_HEIGHT),
    child: AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/radiohead.png",
            height: 40.0,
          ),
          Text(
            "רדיו ישראלי בשידור חי",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
      elevation: 20.0,
    ),
  );
}

class BottomPlayerContainer extends StatefulWidget {
  @override
  _BottomPlayerContainerState createState() => _BottomPlayerContainerState();
}

class _BottomPlayerContainerState extends State<BottomPlayerContainer> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
