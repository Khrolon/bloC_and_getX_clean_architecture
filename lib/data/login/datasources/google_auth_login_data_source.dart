import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleLoginDataSource {
  Future<GoogleSignInAccount?> googleLogin();
}