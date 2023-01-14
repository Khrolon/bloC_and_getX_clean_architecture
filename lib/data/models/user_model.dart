import 'package:poc/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required int id,
      required String picture,
      required String name,
      required String email})
      : super(
          id: id,
          picture: picture,
          name: name,
          email: email,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? 0,
        picture: json['picture'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'picture': picture,
        'name': name,
        'email': email,
      };
}
