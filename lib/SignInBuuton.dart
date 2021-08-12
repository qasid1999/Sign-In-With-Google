import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInWithGooglee extends StatelessWidget {
  Future<User> _signIn() async {
    final googlesignin = GoogleSignIn();
    final googleuser = await googlesignin.signIn();
    if (googleuser != null) {
      final googleauth = await googleuser.authentication;
      if (googleauth.idToken != null) {
        final userCredential = await FirebaseAuth.instance
            .signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleauth.idToken,
          accessToken: googleauth.accessToken,
        ));
        return userCredential.user;
      } else {
        throw FirebaseAuthException(
            code: "ERROR-MISSING-GOOGLE-TOKEN",
            message: "Missing google ID token");
      }
    } else {
      throw FirebaseAuthException(
          code: "ERROR-ABBORTED-BY-USER", message: "Sign in abborted by user");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In With Google"),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          child: Text("Sign In With Google"),
          onPressed: _signIn,
        ),
      ),
    );
  }
}
