import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    this.child,
    this.color,
    this.borderRadius,
    this.onPressed,
  });

  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      // child: Text(
      //   'Sign in with Google',
      //   style: TextStyle(color: Colors.black87, fontSize: 15.0),
      // ),
      child: child,
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      onPressed: onPressed,
    );
  }
}
