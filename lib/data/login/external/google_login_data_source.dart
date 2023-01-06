import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleLoginDataSource {
  Future<bool> googleLogin();
}

class GoogleLoginData extends GoogleLoginDataSource {
  final _googleSignIn = GoogleSignIn();

  @override
  Future<bool> googleLogin() async {
    print("Print chegou na camada data.");
    try {
      _googleSignIn.signIn();
      return true;
    } catch (e) {
      return false;
    }
  }
}
