// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:poc/domain/login/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    int? id,
    String? name,
    String? email,
    bool? isDev,
  }) : super(
          id: id,
          name: name,
          email: email,
          isDev: isDev,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'isDev': isDev,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel();
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
