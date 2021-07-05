part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLogedIn extends AuthState {}

class AuthNotLogedIn extends AuthState {}

class AuthLoginSuccess extends AuthState {}

class AuthLoginFailed extends AuthState {}

class AuthLoginLoading extends AuthState {}

class AuthLoginNewUser extends AuthState {}
