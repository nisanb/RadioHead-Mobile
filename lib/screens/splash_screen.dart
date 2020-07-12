import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radiohead/controllers/main_controller.dart';
import 'package:radiohead/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static String ROUTE = '/';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void verifyState() async {
    bool response =
        await Provider.of<MainController>(context).fireBaseController.login();
    if (response) {
      Navigator.popAndPushNamed(context, HomeScreen.ROUTE);
    }
  }

  @override
  Widget build(BuildContext context) {
    verifyState();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(height: 20.0),
          Text("Loading..."),
        ],
      ),
    );
  }
}
