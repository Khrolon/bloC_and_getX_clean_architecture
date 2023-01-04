import 'package:google_sign_in/google_sign_in.dart';
import 'package:poc/data/login/models/user_model.dart';

abstract class GoogleLoginDataSource {
  Future<GoogleSignInAccount?> googleLogin();
}

class GoogleLogin extends GoogleLoginDataSource {
  final _googleSignIn = GoogleSignIn();

  @override
  Future<GoogleSignInAccount?> googleLogin() {
    return _googleSignIn.signIn();
  }
}
