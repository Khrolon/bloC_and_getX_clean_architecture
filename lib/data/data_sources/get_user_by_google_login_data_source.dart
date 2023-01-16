import 'package:poc/data/external/google_sign_in.dart';

abstract class IGetUserByGoogleLoginDataSource {
  Future<GoogleSignInUser> getUserByGoogleLogin();
}

class GetUserByGoogleLoginDataSource extends IGetUserByGoogleLoginDataSource {
  final GoogleSignInExternal googleSignInExternal;

  GetUserByGoogleLoginDataSource(this.googleSignInExternal);
  @override
  Future<GoogleSignInUser> getUserByGoogleLogin() async {
    try {
      final user = await googleSignInExternal.googleSignInExternal();
      print(user.displayName);
      return user;
    } catch (e) {
      throw Exception();
    }
  }
}
