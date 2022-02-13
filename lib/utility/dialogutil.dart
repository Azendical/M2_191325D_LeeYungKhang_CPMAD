import 'package:flutter/material.dart';

void showDialogOK(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (_) => new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      title: new Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Ok'),
        ),
      ],
    ),
  );
}
