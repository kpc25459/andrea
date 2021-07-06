import 'package:andrea/common_widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      //color: Colors.yellow,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8.0,
          ),
          CustomRaisedButton(
            child: Text(
              'Sign in with Google',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            color: Colors.white,
            borderRadius: 4.0,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
