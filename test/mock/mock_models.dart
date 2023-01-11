import 'package:poc/data/models/user_model.dart';
import 'package:poc/domain/entities/user_entity.dart';

final mockUser = UserEntity(
    id: 10, picture: 'picture', name: '123', email: 'hawike6670@octovie.com');

final mockUserModel = UserModel(
    id: 10, picture: 'picture', name: '123', email: 'hawike6670@octovie.com');

final mockJsonUSer = """{
  "id": 10,
  "picture": "picture",
  "name": "123",
  "email": "hawike6670@octovie.com"
}""";

final mockJsonToken = """{
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJNaXRyYSIsImp0aSI6IjEwIiwic3ViIjoiaGF3aWtlNjY3MEBvY3RvdmllLmNvbSIsImlhdCI6MTY3MTgyMDk5MCwiZXhwIjoyNTM1ODIwOTkwfQ.hZjCtybAeZwjYQg_BS1etNoYFhp40DyngZn4G9fdPRk",
    "type": "Bearer",
    "accessType": null
}""";
