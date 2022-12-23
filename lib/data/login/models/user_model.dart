// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:poc/domain/login/entities/user_entity.dart';

class UserModel extends UserEntity {
  final int id;
  final String name;
  final String email;
  final bool isDev;

  UserModel(this.id, this.name, this.email, this.isDev);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'isDev': isDev,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['id'] as int,
      map['name'] as String,
      map['email'] as String,
      map['isDev'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
