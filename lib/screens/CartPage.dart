import 'package:flutter/material.dart';
import 'package:yk_project/screens/CartProvider.dart';

import 'package:provider/provider.dart';
import 'package:yk_project/tabs/TabsPage.dart';

class CartPage extends StatelessWidget {
  final imgPath;
  final sName;
  final sPrice;
  const CartPage({Key key, this.imgPath, this.sName, this.sPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Inject Provider Instance
    var cartProvider = Provider.of<CartProvider>(context);
    var cart = cartProvider.cart;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Your Cart",
            style: TextStyle(
              color: Colors.yellow[700],
            ),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TabsPage(selectedIndex: 0),
                ),
              );
            },
          ),
          backgroundColor: Color(0xFF393d46),
          actions: [
            Center(
              child: Text(
                'Total: ' + cartProvider.cartCount.toString(),
                style: TextStyle(
                  color: Colors.yellow[700],
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            int cartIndex = cart.keys.toList()[index];
            int count = cart[cartIndex];
            return ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/clothing_${imgPath + 1}.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              title: Text('Name: $sName'),
              trailing: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  cartProvider.clear(cartIndex);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
