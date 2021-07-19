import 'package:andrea/app/home_page.dart';
import 'package:andrea/app/sign_in/sign_in_page.dart';
import 'package:andrea/services/auth.dart';
import 'package:andrea/services/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);
    return StreamBuilder<User>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;

          if (user == null) return SignInPage();

          return HomePage();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
