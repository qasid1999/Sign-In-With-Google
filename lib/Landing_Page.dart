import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Home_Page.dart';
import 'SignInBuuton.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Stream<User> authstateChanges() {
      return FirebaseAuth.instance.authStateChanges();
    }

    return StreamBuilder<User>(
      stream: authstateChanges(),
      builder: (context, snapshoot) {
        if (snapshoot.connectionState == ConnectionState.active) {
          final User user = snapshoot.data;
          if (user == null) {
            return SignInWithGooglee();
          }
          return HomePage();
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
