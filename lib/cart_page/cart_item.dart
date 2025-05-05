import 'package:flutter/cupertino.dart';


import 'package:provider/provider.dart';
import 'package:seanotes/providers/cart_items_provider.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  final int id;
  final String image;
  final String name;
  final int price;
  final String brand;
  int quantity;

  CartItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.brand,
    required this.id,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(
              255, 232, 232, 235), // Mimic card background color
          borderRadius: BorderRadius.circular(15), // Set card's corner radius
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 150, 150, 150)
                  .withOpacity(0.4), // Set shadow color
              blurRadius: 5, // Adjust blur radius
              spreadRadius: 5, // Adjust shadow spread
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Image.network(image)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, left: 0, right: 15, bottom: 5),
                  child: Text(
                    "$brand $name",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 15),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (quantity > 1) {
                            quantity--;
                            context.read<CartItemsprovider>().calctotal();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 60, 60, 60),
                                    blurRadius: 5,
                                    spreadRadius: 1)
                              ]),
                          child: const Icon(
                            CupertinoIcons.minus,
                            size: 18,
                          ),
                        ),
                      ),
                      Consumer<CartItemsprovider>(
                          builder: (context, cartitemProvider, child) {
                        final productData = cartitemProvider.cartitem;
                        if (productData.isEmpty) {
                          return const Center(child: Text("Cart List Empty"));
                        }
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            quantity.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        );
                      }),
                      GestureDetector(
                        onTap: () {
                          quantity++;
                          context.read<CartItemsprovider>().calctotal();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 60, 60, 60),
                                    blurRadius: 5,
                                    spreadRadius: 1)
                              ]),
                          child: const Icon(
                            CupertinoIcons.add,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  context.read<CartItemsprovider>().removeFromCart(id);
                  context.read<CartItemsprovider>().decrescounter();
                },
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 10),
                  child: ImageIcon(
                    AssetImage('assets/icons/trash.png'),
                    color: Color.fromARGB(255, 255, 0, 0),
                    size: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  " \$ ${price.toString()}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
