import 'package:campskuy/bloc/auth_bloc.dart';
import 'package:campskuy/screen/home_screen.dart';
import 'package:campskuy/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthBloc authBloc = AuthBloc();

  @override
  void initState() {
    authBloc.add(CheckAuthState());
    super.initState();
  }

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
          bloc: authBloc,
          listener: (context, state) {
            if (state is AuthNotLogedIn) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
              ;
            } else if (state is AuthLogedIn) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
              ;
            }
          },
          child: Container(
              height: double.infinity,
              color: Color.fromRGBO(83, 193, 143, 1.0),
              child: Image.asset("images/Campskuy_7.png"))),
    );
  }
}
