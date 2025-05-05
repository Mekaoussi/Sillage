import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seanotes/cart_page/cart_order.dart';

import 'package:seanotes/providers/cart_items_provider.dart';

// ignore: unused_element

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: double.infinity,
      child: Consumer<CartItemsprovider>(
        builder: (context, cartitemProvider, child) {
          final productData = cartitemProvider.cartitem;
          if (productData.isEmpty) {
            return const Center(child: Text("Cart List Empty"));
          }
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 500,
                    child: ListView.builder(
                        itemCount: productData.length,
                        itemBuilder: (context, index) {
                          return productData[index];
                        }),
                  ),
                ),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 212, 212, 214),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 60, 60, 60),
                            blurRadius: 5,
                            spreadRadius: 1)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Consumer<CartItemsprovider>(
                              builder: (context, cartitemProvider, child) {
                            final productData = cartitemProvider.cartitem;
                            if (productData.isEmpty) {
                              return const Center(
                                  child: Text("Cart List Empty"));
                            }
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, bottom: 10, right: 5),
                              child: Text(
                                "Total Price :  \$ ${context.read<CartItemsprovider>().getTotal()}",
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontFamily: "lato",
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 0, left: 70, top: 3),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shadowColor: MaterialStateProperty.all(
                                        const Color.fromARGB(200, 255, 0, 0)),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(200, 255, 0, 0))),
                                onPressed: () {
                                  context
                                      .read<CartItemsprovider>()
                                      .clearcounter();
                                  context.read<CartItemsprovider>().clearCart();
                                },
                                child: const Text(
                                  "Clear",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shadowColor: MaterialStateProperty.all(
                                      const Color.fromARGB(200, 0, 80, 220)),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(200, 0, 80, 220))),
                              onPressed: () async {
                                sendOrder(context
                                    .read<CartItemsprovider>()
                                    .getOreder());
                                String stat = await sendOrder(context
                                    .read<CartItemsprovider>()
                                    .getOreder());
                                if (stat == "Failed") {
                                  showDialog(
                                    // ignore: use_build_context_synchronously
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 210, 210, 230),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          height: 100,
                                          width: 300,
                                          child: Column(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Text(
                                                  "Somthing Went Wrong !",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 0),
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        shadowColor:
                                                            MaterialStateProperty
                                                                .all(const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    255,
                                                                    0,
                                                                    0)),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(const Color
                                                                    .fromARGB(
                                                                    200,
                                                                    255,
                                                                    0,
                                                                    0))),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text(
                                                      "Confirm",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              220,
                                                              220,
                                                              220),
                                                          fontSize: 15),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  showDialog(
                                    // ignore: use_build_context_synchronously
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 210, 210, 230),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          height: 200,
                                          width: 300,
                                          child: Column(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    right: 5,
                                                    bottom: 5),
                                                child: Text(
                                                  "Order Sent Sucessfully !",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Text(
                                                  "Your Order ID : ",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                  "${jsonDecode(stat)['order_id']}",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 0),
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        shadowColor:
                                                            MaterialStateProperty
                                                                .all(const Color
                                                                    .fromRGBO(
                                                                    219,
                                                                    174,
                                                                    47,
                                                                    0.82)),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(const Color
                                                                    .fromRGBO(
                                                                    219,
                                                                    174,
                                                                    47,
                                                                    0.82))),
                                                    onPressed: () {
                                                      // ignore: use_build_context_synchronously
                                                      context
                                                          .read<
                                                              CartItemsprovider>()
                                                          .clearcounter();
                                                      // ignore: use_build_context_synchronously
                                                      context
                                                          .read<
                                                              CartItemsprovider>()
                                                          .clearCart();
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context)
                                                          .pop();
                                                      // getOrderNotification();
                                                    },
                                                    child: const Text(
                                                      "Confirm",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontSize: 15),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              child: const Text(
                                "ORDER NOW !",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
