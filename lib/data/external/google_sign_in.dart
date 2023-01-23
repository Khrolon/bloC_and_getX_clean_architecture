// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleSignInExternal {
  Future<bool> googleSignInExternal();
  Future<bool> googleLogout();
}

class GoogleSignInCall extends GoogleSignInExternal {
  final _googleSignIn = GoogleSignIn();
  @override
  Future<bool> googleSignInExternal() async {
    GoogleSignInAccount? user;

    if (_googleSignIn.currentUser != null) {
      _googleSignIn.disconnect();
    }

    await _googleSignIn.signIn().then((result) async {
      user = result;
      await result!.authentication.then(
        (value) {
          GetStorage().write('web_token', (value.accessToken).toString());
        },
      );
    });
    if (user == null) {
      throw Exception();
    } else {
      return true;
    }
  }

  @override
  Future<bool> googleLogout() async {
    try {
      await _googleSignIn.disconnect();
      return true;
    } catch (e) {
      throw Exception();
    }
  }
}
