import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class UsersModel extends Equatable {
  final DateTime dob;
  final String displayPicture;
  final String email;
  final String gender;
  final String name;
  final String phone;

  UsersModel(this.dob, this.displayPicture, this.email, this.gender, this.name,
      this.phone);

  Map<String, dynamic> toJson() => {
        "date_of_birth": dob,
        "display_picture": displayPicture,
        "email": email,
        "gender": gender,
        "name": name,
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}
