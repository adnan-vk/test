// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/controller/provider.dart';
import 'package:test/view/cart.dart';

List productname = [];
List productprice = [];

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ));
              },
              icon: const Icon(
                Icons.shopping_bag,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(product[index]),
                    subtitle: Text(price[index]),
                    trailing: IconButton(
                        onPressed: () {
                          // productname.add(product[index]);
                          // productprice.add(price[index]);
                          Provider.of<CartProvider>(context, listen: false)
                              .addProductToCart(product[index], price[index]);
                        },
                        icon: const Icon(Icons.shopping_bag_outlined)),
                  ),
                );
              },
              itemCount: product.length,
            ),
          ),
        ],
      ),
    );
  }

  List product = ["name1", "name2", "name3", "name4", "name5"];
  List price = ["100", "200", "150", "130", "220"];
}
