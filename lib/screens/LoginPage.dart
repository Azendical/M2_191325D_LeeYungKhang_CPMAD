import 'package:flutter/material.dart';
import 'package:yk_project/screens/RegisterPage.dart';
import 'package:yk_project/tabs/TabsPage.dart';
import 'package:yk_project/widgets/button.dart';
import 'package:yk_project/widgets/passformfield.dart';
import 'package:yk_project/widgets/screenshange.dart';
import 'package:yk_project/widgets/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

bool isLoading = false;
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
String email;
String password;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF393d46),
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildAllPart(),
            ],
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
            .signInWithEmailAndPassword(email: email, password: password);
        print(result.user.uid);
      } on Exception catch (e) {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    } else {
      print('Fail');
    }
  }

  Widget _buildAllPart() {
    return Container(
      height: 500,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Login',
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.yellow[700]),
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
          //Register Button
          MyButton(
            name: 'Login',
            onPressed: () {
              validation();
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (_) => StreamBuilder(
              //       stream: FirebaseAuth.instance.authStateChanges(),
              //       builder: (context, snapShot) {
              //         if (snapShot.hasData) {
              //           return TabsPage(selectedIndex: 0);
              //         } else {
              //           return LoginPage();
              //         }
              //       },
              //     ),
              //   ),
              // );
              // Navigator.of(context).pushReplacement(
              //   CupertinoPageRoute(
              //     builder: (_) => StreamBuilder(
              //         stream: FirebaseAuth.instance.authStateChanges(),
              //         builder: (context, snapShot) {
              //           if (snapShot.hasData) {
              //             return TabsPage(selectedIndex: 0);
              //           } else {
              //             return LoginPage();
              //           }
              //         }),
              //   ),
              // );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TabsPage(selectedIndex: 0),
                ),
              );
            },
          ),
          //Registration Row
          ChangeScreen(
            name: "Register",
            whichAccount: "I do not have an account",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => RegistrationPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
