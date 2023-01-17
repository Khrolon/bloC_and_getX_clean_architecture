import 'package:poc/data/external/google_sign_in.dart';

abstract class IGetUserByGoogleLoginDataSource {
  Future<bool> getUserByGoogleLogin();
}

class GetUserByGoogleLoginDataSource extends IGetUserByGoogleLoginDataSource {
  final GoogleSignInExternal googleSignInExternal;

  GetUserByGoogleLoginDataSource(this.googleSignInExternal);
  @override
  Future<bool> getUserByGoogleLogin() async {
    try {
      return await googleSignInExternal.googleSignInExternal();
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
