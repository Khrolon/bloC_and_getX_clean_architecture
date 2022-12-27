import 'package:google_sign_in/google_sign_in.dart';
import 'package:poc/data/login/datasources/google_auth_login_data_source.dart';

class GoogleAuthLogin extends GoogleAuthLoginDataSource {
  final _googleSignIn = GoogleSignIn();

  @override
  Future<GoogleSignInAccount?> loginGoogle() {
    return _googleSignIn.signIn();
  }
}
