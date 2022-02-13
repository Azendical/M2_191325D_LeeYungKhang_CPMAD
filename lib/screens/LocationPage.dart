import 'package:flutter/material.dart';
import 'package:yk_project/sidemenu/SideMenuPage.dart';

class LocationPage extends StatefulWidget {
  final imgPath;
  final sLocation;
  final sLatitude;
  final sLongtitude;
  LocationPage(
      {Key key, this.imgPath, this.sLocation, this.sLatitude, this.sLongtitude})
      : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final _location = [
    'Bugis Junction',
    'Vivo City',
    'AMK Hub',
    'Suntec City',
    'Jurong Point',
  ];

  final _latitude = [
    '1.3007',
    '1.2644',
    '1.3695',
    '1.2950',
    '1.3397',
  ];

  final _longtitude = [
    '103.8550',
    '103.8222',
    '103.8484',
    '103.8583',
    '103.7067',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      backgroundColor: Color(0xFF393d46),
      appBar: AppBar(
        title: Text(
          'Locate Us',
          style: TextStyle(color: Colors.yellow[700]),
        ),
        backgroundColor: Colors.black87,
      ),
      body: ListView(
        children: List.generate(
          5,
          (index) {
            return Container(
              child: _buildGridCards(index, 'images/location_${index + 1}.jpg',
                  _location[index], _latitude[index], _longtitude[index]),
            );
          },
        ),
      ),
    );
  }
}

Widget _buildGridCards(int index, String imgPath, String sLocation,
    String sLatitude, String sLongtitude) {
  return Container(
    child: Card(
      color: Colors.blueAccent[50],
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          //Image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 140.0,
              width: 150.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            children: <Widget>[
              //Text Description
              Text(
                sLocation,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //Text Price
              Text(
                'Locate us here',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          //Button
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MapPage(
              //       imgPath: 'images/shoe_${index + 1}.jpg',
              //       sLongtitude : 'sLongtitude'
              //       sLatitude : 'sLatitude'
              //       sName: '$sName',
              //     ),
              // ),
              // );
            },
          ),
        ],
      ),
    ),
  );
}
