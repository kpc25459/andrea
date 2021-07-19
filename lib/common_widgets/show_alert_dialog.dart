import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Metoda może zwrócić true, false lub null jeśli użyjemy strzałki Wstecz
Future<bool> showAlertDialog(
  BuildContext context, {
  @required String title,
  @required String content,
  String cancelActionText,
  @required String defaultActionText,
}) {
  if (!Platform.isIOS) {
    return showDialog(
        context: context,
        //barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              if (cancelActionText != null)
                FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(cancelActionText)),
              FlatButton(
                child: Text(defaultActionText),
                onPressed: () => Navigator.of(context).pop(true),
              )
            ],
          );
        });
  } else {
    return showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              if (cancelActionText != null)
                CupertinoDialogAction(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(cancelActionText)),
              CupertinoDialogAction(
                child: Text(defaultActionText),
                onPressed: () => Navigator.of(context).pop(true),
              )
            ],
          );
        });
  }
}
