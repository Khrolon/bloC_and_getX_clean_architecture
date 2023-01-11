import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:poc/data/models/user_model.dart';
import 'package:poc/domain/entities/user_entity.dart';

import '../../mock/mock_models.dart';

void main() {
  test('Should return a subclass of user entity', () async {
    //Arrange
    //Act
    //Assert
    expect(mockUserModel, isA<UserEntity>());
  });

  test("Should return a valid model", () {
    //Arrange
    Map<String, dynamic> jsonMap = json.decode(mockJsonUSer);
    //Act
    final result = UserModel.fromJson(jsonMap);
    //Assert
    expect([
      mockUserModel.id,
      mockUserModel.name,
      mockUserModel.email,
      mockUserModel.picture
    ], [
      result.id,
      result.name,
      result.email,
      result.picture
    ]);
  });

  test("Should return a json map", () {
    //Arrange
    final expectedJson = {
      "id": 10,
      "picture": "picture",
      "name": "123",
      "email": "hawike6670@octovie.com"
    };
    //Act
    final result = mockUserModel.toJson();
    //Assert
    expect(result, expectedJson);
  });
}
