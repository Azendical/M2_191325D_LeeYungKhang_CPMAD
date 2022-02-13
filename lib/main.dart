import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yk_project/screens/CartProvider.dart';
import 'package:yk_project/screens/WelcomePage.dart';
import 'package:yk_project/tabs/TabsPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(ChangeNotifierProvider(
    //Register the Central Data Store
    create: (context) => CartProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash: 'images/Logo.jpg',
        splashIconSize: double.infinity,
        duration: 3000,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Color(0xFF393d46),
        // nextScreen: TabsPage(selectedIndex: 0),
        nextScreen: WelcomePage(),
      ),
    );
  }
}
