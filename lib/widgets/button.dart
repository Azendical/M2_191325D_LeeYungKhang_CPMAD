import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String name;

  const MyButton({Key key, this.onPressed, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      child: RaisedButton(
          child: Text(name), color: Colors.white, onPressed: onPressed),
    );
  }
}
