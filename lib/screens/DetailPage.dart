import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yk_project/screens/CartProvider.dart';
import 'package:yk_project/screens/CartPage.dart';

class DetailPage extends StatefulWidget {
  final imgPath;
  final sName;
  final sPrice;
  DetailPage({Key key, this.imgPath, this.sName, this.sPrice})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String dropdownValue;
  var shirtSize = ['XXXS', 'XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  var totalprice;
  int quantity = 0;

  void add() {
    setState(() {
      quantity++;
      // totalprice = '$quantity' * int.parse(widget.sPrice);
    });
  }

  void minus() {
    setState(() {
      quantity--;
      // totalprice = '$quantity' * int.parse(widget.sPrice);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Inject Provider Instance
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(
            color: Colors.yellow[700],
          ),
        ),
        backgroundColor: Color(0xFF393d46),
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
      body: Center(
        child: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              //Product Picture
              Container(
                height: 300,
                width: 280,
                child: SizedBox(
                  child: Hero(
                    tag: 'images/${widget.imgPath}',
                    child: Image(
                      image: AssetImage('${widget.imgPath}'),
                    ),
                  ),
                ),
              ),
              //Product Name
              Text(
                '${widget.sName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              //Size Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Clothing Size: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    style: TextStyle(color: Colors.white),
                    dropdownColor: Colors.grey,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: shirtSize.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    hint: Text(
                      "Choose a size",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onChanged: (String newValue) {
                      setState(
                        () {
                          dropdownValue = newValue;
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              //Quantity Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Quantity: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    onPressed: minus,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: add,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              //Price Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Price: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    // '\${totalprice}',
                    '${widget.sPrice}',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              //Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onSurface: Colors.blue,
                ),
                child: Container(
                  child: Text(
                    'Go To Cart',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                onPressed: shirtSize != null && quantity != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(
                                // imgPath:
                                //     'images/clothing_${widget.imgPath + 1}.jpg',
                                // sName: '$widget.sName',
                                // sPrice: '$widget.sPrice',
                                ),
                          ),
                        );
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
