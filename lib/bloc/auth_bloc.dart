import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:campskuy/model/user_model.dart';
import 'package:campskuy/repository/auth_repos.dart';
import 'package:campskuy/utils/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is CheckAuthState) {
      FirebaseAuth auth = FirebaseAuth.instance;

      if (auth.currentUser != null) {
        yield AuthLogedIn();
      } else {
        yield AuthNotLogedIn();
      }
    } else if (event is LoginWithGoogle) {
      yield AuthLoginLoading();
      UserCredential auth = await AuthRepository().signInWithGoogle();
      DocumentSnapshot user = await AuthRepository().getUser();
      if (user.exists) {
        yield AuthLoginSuccess();
      } else {
        yield AuthLoginNewUser();
      }
    } else if (event is CompleteProfile) {
      yield AuthLoginLoading();
      bool check =
          inputValidation(event.dob, event.name, event.phone, event.gender);
      if (check) {
        bool status = await AuthRepository()
            .addUser(event.dob, event.name!, event.gender!, event.phone!);
        yield AuthLoginSuccess();
      } else {
        yield AuthLoginFailed();
      }
    }
  }
}
