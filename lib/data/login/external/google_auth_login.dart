import 'package:google_sign_in/google_sign_in.dart';
import 'package:poc/data/login/datasources/google_auth_login_data_source.dart';

class GoogleLogin extends GoogleLoginDataSource {
  final _googleSignIn = GoogleSignIn();

  @override
  Future<GoogleSignInAccount?> googleLogin() {
    return _googleSignIn.signIn();
  }
}
