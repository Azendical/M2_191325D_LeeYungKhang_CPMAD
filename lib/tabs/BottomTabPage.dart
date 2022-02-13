import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yk_project/screens/AboutPage.dart';
import 'package:yk_project/screens/HomePage.dart';
import 'package:yk_project/screens/LocationPage.dart';
// import 'package:tabsdrawer/screens/profile.dart';
// import 'package:tabsdrawer/screens/search.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem({this.page, this.title, this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: HomePage(),
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        TabNavigationItem(
          page: LocationPage(),
          icon: Icon(Icons.location_pin),
          title: Text("Locate Us"),
        ),
        TabNavigationItem(
          page: AboutPage(),
          icon: Icon(Icons.info_outlined),
          title: Text("About Us"),
        ),
      ];
}
