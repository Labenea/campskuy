import 'package:campskuy/bloc/auth_bloc.dart';
import 'package:campskuy/screen/home_screen.dart';
import 'package:campskuy/screen/update_profile_screen.dart';
import 'package:campskuy/utils/color_utils.dart';
import 'package:campskuy/widget/logo_button.dart';
import 'package:campskuy/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthBloc authBloc = AuthBloc();

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocConsumer(
      bloc: authBloc,
      listener: (context, state) {
        if (state is AuthLoginSuccess) {
          print("su");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else if (state is AuthLoginNewUser) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => UpdateProfileScreen()));
        }
      },
      builder: (context, state) {
        if (state is AuthLoginLoading) {
          return Stack(
            children: [
              defaultLogin(),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black54,
                child: Center(
                    child: SpinKitFadingCube(
                  color: Colors.white,
                  size: 50,
                )),
              )
            ],
          );
        }
        return defaultLogin();
      },
    )));
  }

  SingleChildScrollView defaultLogin() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "images/camp.png",
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: ColorsUtil.accentGreen,
                            ),
                            hintText: "Enter your email",
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsUtil.accentGreen),
                            )),
                        cursorColor: ColorsUtil.accentGreen,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter your password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: ColorsUtil.accentGreen,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsUtil.accentGreen),
                            )),
                        cursorColor: ColorsUtil.accentGreen,
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(color: Colors.blueGrey[400]),
                            ),
                            style: TextButton.styleFrom(),
                          )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: MainButton(
                          title: "Login",
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              height: 10,
                              endIndent: 10,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "or login with",
                            style: TextStyle(color: Colors.blueGrey[400]),
                          ),
                          Expanded(
                              child: Divider(
                            height: 10,
                            indent: 10,
                            color: Colors.black,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: LogoButton(
                              icon: "images/google_icon.png",
                              title: "Login With Google",
                              onTap: () {
                                authBloc.add(LoginWithGoogle());
                              },
                              borderColor: ColorsUtil.primaryGreen,
                              textColor: ColorsUtil.primaryGreen)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New to Campskuy?",
                            style: TextStyle(color: Colors.blueGrey[400]),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Color.fromRGBO(14, 164, 122, 1.0)),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
