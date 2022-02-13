import 'package:flutter/material.dart';

class Textformfield extends StatelessWidget {
  final String name;
  final Function validator;
  final Function onChanged;

  const Textformfield({Key key, this.name, this.validator, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        hintText: name,
      ),
    );
  }
}
