import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './profile_page_google.dart';
import './signupPage2.dart';

import 'LoginPage.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin(BuildContext context) async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(credential);

      User? user = result.user;

      if (result != null) {
        await Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ProfilePage2())); //
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  void signOutGoogle(BuildContext context) async {
    await googleSignIn.signOut();
    print("User Sign Out");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
