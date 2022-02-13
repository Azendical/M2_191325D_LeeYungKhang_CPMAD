import 'package:flutter/material.dart';
import 'package:yk_project/screens/LoginPage.dart';
import 'package:yk_project/widgets/button.dart';
import 'package:yk_project/widgets/passformfield.dart';
import 'package:yk_project/widgets/screenshange.dart';
import 'package:yk_project/widgets/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
String email;
String password;

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF393d46),
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow[700],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildBottomPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validation() async {
    final FormState _form = _formKey.currentState;
    if (!_form.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(result.user.uid);
      } on Exception catch (e) {
        print(e.toString());
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    } else {}
  }

  Widget _buildAllTextFormField() {
    return Container(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //Username Textfields
          Textformfield(
            name: "User Name",
            validator: (value) {
              if (value.length < 6) {
                return 'User Name is too short';
              } else if (value == '') {
                return 'Please fill in a User Name';
              }
              return "";
            },
          ),
          //Email Textfields
          Textformfield(
            name: "Email",
            onChanged: (value) {
              setState(() {
                email = value;
                print(email);
              });
            },
            validator: (value) {
              if (value == '') {
                return 'Please fill in an Email';
              } else if (!regExp.hasMatch(value)) {
                return 'Email typed in is invalid';
              }
              return '';
            },
          ),
          //Phone Number Textfields
          Textformfield(
            name: "Phone Number",
            validator: (value) {
              if (value == '') {
                return 'Please fill in a Phone Number';
              } else if (value.length < 8) {
                return 'Phone Number must be 8 digits long';
              }
              return '';
            },
          ),
          //Password Textfields
          PassTextFormField(
            obserText: obserText,
            name: "Password",
            onChanged: (value) {
              setState(() {
                password = value;
                print(password);
              });
            },
            validator: (value) {
              if (value == '') {
                return 'Please fill in a Password';
              } else if (value.length < 8) {
                return 'Password is too short';
              }
              return '';
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(
                () {
                  obserText = !obserText;
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          _buildAllTextFormField(),
          //Register Button
          MyButton(
            name: 'Register',
            onPressed: () {
              validation();
            },
          ),
          SizedBox(
            height: 10,
          ),
          //Login Row
          ChangeScreen(
            name: "Login",
            whichAccount: "I already have an account",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
