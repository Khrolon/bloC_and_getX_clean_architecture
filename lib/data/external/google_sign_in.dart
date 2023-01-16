// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleSignInExternal {
  Future<GoogleSignInUser> googleSignInExternal();
}

class GoogleSignInUser {
  String displayName;
  String email;
  String photoUrl;
  GoogleSignInUser({
    required this.displayName,
    required this.email,
    required this.photoUrl,
  });
}

class GoogleSignInCall extends GoogleSignInExternal {
  final _googleSignIn = GoogleSignIn();
  @override
  Future<GoogleSignInUser> googleSignInExternal() async {
    GoogleSignInAccount? user;
    _googleSignIn.disconnect();
    await _googleSignIn.signIn().then((result) {
      user = result;
      result!.authentication.then(
        (value) {
          print('acess token: ${value.accessToken}');
          print('id token: ${value.idToken}');
        },
      );
    });
    if (user == null) {
      throw Expando();
    } else {
      print(user!.authentication);
      print('aaa');
      return GoogleSignInUser(
        displayName: user!.displayName!,
        email: user!.email,
        photoUrl: user!.photoUrl!,
      );
    }
  }
}
