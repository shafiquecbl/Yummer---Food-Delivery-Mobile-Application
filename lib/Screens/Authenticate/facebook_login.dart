import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SocialLogin {
  FacebookAuth facebookAuth = FacebookAuth.instance;

  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await facebookAuth.login();
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      print('STATUSSSSSSSSSS: ${result.status} MESSAGE: ${result.message}');
    }
  }
}
