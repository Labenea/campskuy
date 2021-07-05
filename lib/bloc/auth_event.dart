part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckAuthState extends AuthEvent {}

class LoginWithGoogle extends AuthEvent {}

class CompleteProfile extends AuthEvent {
  final String? name;
  final DateTime? dob;
  final String? gender;
  final String? phone;

  CompleteProfile(this.name, this.dob, this.gender, this.phone);
}
