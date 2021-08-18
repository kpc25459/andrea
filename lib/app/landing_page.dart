import 'package:andrea/app/home/jobs_page.dart';
import 'package:andrea/app/sign_in/2valueNotifier/sign_in_page.dart';
import 'package:andrea/services/auth.dart';
import 'package:andrea/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;

          if (user == null) return SignInPage.create(context);

          return Provider<Database>(
              create: (_) => FirestoreDatabase(uid: user.uid),
              child: JobsPage());
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
