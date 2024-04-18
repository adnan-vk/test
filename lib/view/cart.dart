// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, value, child) => ListView.builder(
                itemBuilder: (context, index) {
                  final providerr =
                      Provider.of<CartProvider>(context, listen: false);
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(value.cartItems[index]),
                              Text(value.cartPrice[index]),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    providerr.addcount();
                                  },
                                  icon: const Icon(Icons.add)),
                              Consumer<CartProvider>(
                                  builder: (context, value, child) =>
                                      Text(value.count.toString())),
                              IconButton(
                                  onPressed: () {
                                    providerr.lesscount(index);
                                  },
                                  icon: const Icon(Icons
                                      .linear_scale_sharp)), //icon for decrease the count
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: Provider.of<CartProvider>(context).cartItems.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List product = ["name1", "name2", "name3", "name4", "name5"];
  List price = ["100", "200", "150", "130", "220"];
}
