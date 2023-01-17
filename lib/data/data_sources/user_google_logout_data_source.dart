// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:poc/data/external/google_sign_in.dart';

abstract class IUserGoogleLogoutDataSource {
  Future<bool> userGoogleLogout();
}

class UserGoogleLogoutDataSource extends IUserGoogleLogoutDataSource {
  final GoogleSignInExternal googleSignInExternal;
  
  UserGoogleLogoutDataSource({
    required this.googleSignInExternal,
  });
  @override
  Future<bool> userGoogleLogout() async {
    try {
      await googleSignInExternal.googleLogout();
      return true;
    } catch (e) {
      throw Exception();
    }
  }
}
