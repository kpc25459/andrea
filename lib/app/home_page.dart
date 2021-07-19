import 'package:andrea/common_widgets/show_alert_dialog.dart';
import 'package:andrea/services/auth_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      defaultActionText: 'OK',
      cancelActionText: 'Cancel',
    );

    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          )
        ],
      ),
    );
  }
}
