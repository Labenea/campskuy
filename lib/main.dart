import 'package:campskuy/screen/splash_screen.dart';
import 'package:campskuy/utils/color_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
        title: 'Campskuy',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: ColorsUtil.primaryGreen,
        ),
        home: SplashScreen());
  }
}
