import 'package:andrea/app/sign_in/email_sign_in_form.dart';
import 'package:andrea/services/auth.dart';
import 'package:flutter/material.dart';

class EmailSignInPage extends StatelessWidget {
  final AuthBase auth;

  const EmailSignInPage({@required this.auth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(child: EmailSignInForm(auth: auth)),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
