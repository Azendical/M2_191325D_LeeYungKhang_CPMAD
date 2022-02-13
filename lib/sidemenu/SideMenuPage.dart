import 'package:flutter/material.dart';
import 'package:yk_project/screens/AboutPage.dart';
import 'package:yk_project/screens/HomePage.dart';
import 'package:yk_project/screens/LocationPage.dart';
import 'package:yk_project/screens/SettingsPage.dart';
import 'package:yk_project/screens/WelcomePage.dart';
import 'package:yk_project/tabs/TabsPage.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/header_bg.jpg'),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      height: 60.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/Chungus.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Tester',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      'Test@gmail.com',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 12.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(selectedIndex: 0)),
                ),
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Locate Us'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(selectedIndex: 1)),
                ),
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outlined),
              title: Text('About Us'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabsPage(selectedIndex: 2)),
                ),
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle_sharp),
              title: Text('My Account'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingPage()),
                ),
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
