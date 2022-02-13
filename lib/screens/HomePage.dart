import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yk_project/screens/CartPage.dart';
import 'package:yk_project/screens/CartProvider.dart';
import 'package:yk_project/screens/DetailPage.dart';
import 'package:yk_project/sidemenu/SideMenuPage.dart';

class HomePage extends StatefulWidget {
  final imgPath;
  final sName;
  final sPrice;
  final user;
  HomePage({Key key, this.imgPath, this.sName, this.sPrice, this.user})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _foodName = [
    'T-Shirt 1',
    'T-Shirt 2',
    'T-Shirt 3',
    'T-Shirt 4',
    'T-Shirt 5',
    'T-Shirt 6',
    'Pants 1',
    'Pants 2',
    'Pants 3',
    'Pants 4',
    'Pants 5',
    'Pants 6',
    'Dress 1',
    'Dress 2',
    'Dress 3',
    'Dress 4',
    'Dress 5',
    'Dress 6',
  ];

  final _foodPrice = [
    '\$35.0',
    '\$25.0',
    '\$20.0',
    '\$30.0',
    '\$35.0',
    '\$40.0',
    '\$25.0',
    '\$25.0',
    '\$30.0',
    '\$15.0',
    '\$20.0',
    '\$30.0',
    '\$35.0',
    '\$40.0',
    '\$30.0',
    '\$35.0',
    '\$25.0',
    '\$25.0',
  ];
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 2;

    return Scaffold(
      drawer: SideMenu(),
      backgroundColor: Color(0xFF393d46),
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.yellow[700]),
        ),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150.0,
              width: 50.0,
              child: InkWell(
                splashColor: Colors.white,
                highlightColor: Colors.yellowAccent.withOpacity(0.5),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ),
                  );
                },
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: 5.0,
                      top: 3.0,
                      child: Stack(
                        children: <Widget>[
                          Icon(
                            Icons.brightness_1,
                            size: 35.0,
                            color: Colors.yellow[700],
                          ),
                          Positioned(
                            top: 5.0,
                            right: 10.5,
                            child: Center(
                              child: Text(
                                cartProvider.count.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(1.0),
          scrollDirection: Axis.vertical,
          childAspectRatio: (itemWidth / itemHeight),
          children: List.generate(
            18,
            (index) {
              return Container(
                child: _buildGridCards(
                    index,
                    'images/clothing_${index + 1}.jpg',
                    _foodName[index],
                    _foodPrice[index]),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGridCards(
      int index, String imgPath, String sName, String sPrice) {
    return Card(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Image
            Container(
              height: 140,
              width: 140,
              child: SizedBox(
                child: Hero(
                  tag: imgPath,
                  child: Image(
                    image: AssetImage(imgPath),
                  ),
                ),
              ),
            ),
            //Text Description
            Text(
              sName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Text Price
            Text(
              sPrice,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            //Button
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      imgPath: 'images/clothing_${index + 1}.jpg',
                      sName: '$sName',
                      sPrice: '$sPrice',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
