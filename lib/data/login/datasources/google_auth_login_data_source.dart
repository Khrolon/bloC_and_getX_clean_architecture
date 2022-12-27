import 'package:google_sign_in/google_sign_in.dart';
import 'package:poc/data/login/models/user_model.dart';

abstract class GoogleAuthLoginDataSource {
  Future<GoogleSignInAccount?> loginGoogle();
}