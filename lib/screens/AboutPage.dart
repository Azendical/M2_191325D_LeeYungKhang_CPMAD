import 'package:flutter/material.dart';
import 'package:yk_project/sidemenu/SideMenuPage.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Clothers',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'A Singapore local clothing store',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.grey[600], Icons.call, 'CALL'),
        _buildButtonColumn(Colors.grey[600], Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Ah Kow started Clothers because of the rising cost of clothing. That is why Clothers has set a path to '
        'help make clothing more affordable to the needy. Along the way, Clothers has also helped the charity by '
        'donating high quality cotton clothing.We want to be able to keep moving forward while keeping mind of helping '
        'the community back.',
        style: TextStyle(
          fontSize: 18,
        ),
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'About Us',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          title: Text(
            'About Us',
            style: TextStyle(color: Colors.yellow[700]),
          ),
          backgroundColor: Colors.black87,
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/Logo.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
