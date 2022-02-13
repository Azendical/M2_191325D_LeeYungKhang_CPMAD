import 'package:flutter/material.dart';
import 'package:yk_project/screens/LoginPage.dart';
import 'package:yk_project/screens/RegisterPage.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF393d46),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image
            Container(
              height: 300.0,
              width: 300.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 10,
                  color: Colors.white,
                ),
              ),
              child: Image(
                image: AssetImage('images/Logo.jpg'),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Sign In Page
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    color: Color(0xFF393d46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.yellow[700]),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                //Sign Up Page
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationPage(),
                          ),
                        );
                      },
                      color: Color(0xFF393d46),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.yellow[700]),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
