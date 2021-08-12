import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  Future<void> _signout() async {
    final googlesignIn = GoogleSignIn();
    await googlesignIn.signOut();
    await FirebaseAuth.instance.signOut();
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
          child: Text("Sign out"),
          onPressed: _signout,
        ),
      ),
    );
  }
}
