import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:seanotes/cart_page/cart_item.dart';

import 'package:seanotes/providers/cart_items_provider.dart';

class ProductPage extends StatefulWidget {
  final int id;
  final String brand;
  final String name;
  final String price;
  final String desc;
  final String consentration;
  final String image;

  const ProductPage(
      {super.key,
      required this.brand,
      required this.name,
      required this.price,
      required this.desc,
      required this.consentration,
      required this.image,
      required this.id});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool toggleheart = false;
  int ishigh = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                toggleheart = !toggleheart;
              });
            },
            child: toggleheart == false
                ? const Padding(
                    padding: EdgeInsets.all(13),
                    child: ImageIcon(
                      AssetImage('assets/icons/heart.png'),
                      size: 50,
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(13),
                    child: ImageIcon(
                      AssetImage('assets/icons/love.png'),
                      size: 50,
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                  ),
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
              height: 430,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  child: Image.network(
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    widget.image,
                  ))),
          const Text(
            '-',
            style: TextStyle(color: Colors.white),
          ),

          //details column
          SizedBox(
            height: 320,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 25, right: 25, bottom: 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.brand.toUpperCase(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 103, 103, 103),
                                  fontFamily: "adamina",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(widget.name.toUpperCase(),
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 220, 220, 220),
                                    fontFamily: "proxima",
                                    fontSize: 30))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Price",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 103, 103, 103),
                                  fontSize: 20,
                                )),
                            Text("\$ ${widget.price}",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 220, 220, 220),
                                    fontFamily: "proxima",
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600))
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(widget.desc,
                              maxLines: 3,
                              softWrap: true,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 150, 150, 150),
                                fontSize: 16,
                              )),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: Text(widget.consentration,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 200, 200, 200),
                                      fontSize: 18,
                                      fontFamily: "lato",
                                      fontWeight: FontWeight.bold)),
                            ),
                            const Text("100ml",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 180, 180, 180),
                                    fontSize: 17,
                                    fontFamily: "adamina"))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("Ratings",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 200, 200, 200),
                                    fontSize: 19)),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 120,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              ishigh = index;
                                            });
                                          },
                                          child: index <= ishigh
                                              ? const Icon(
                                                  Icons.star_rounded,
                                                  color: Color.fromARGB(
                                                      255, 237, 196, 12),
                                                )
                                              : const Icon(
                                                  Icons.star_border_outlined,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                        );
                                      }),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor:
                              const Color.fromARGB(219, 220, 220, 220),
                          minimumSize: const Size(100, 50),
                          maximumSize: const Size(350, 100),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          var x = context.read<CartItemsprovider>().addToCart(
                              CartItem(
                                  quantity: 1,
                                  id: widget.id,
                                  image: widget.image,
                                  name: widget.name,
                                  brand: widget.brand,
                                  price: int.parse(widget.price)));
                          context.read<CartItemsprovider>().calctotal();
                          context.read<CartItemsprovider>().addtocounter();

                          if (x == false) {
                            context.read<CartItemsprovider>().decrescounter();

                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 210, 210, 230),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    height: 100,
                                    width: 300,
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            "Item Already Added",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
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
                                                      MaterialStateProperty.all(
                                                          const Color.fromRGBO(
                                                              219,
                                                              174,
                                                              47,
                                                              0.82)),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          const Color.fromRGBO(
                                                              219,
                                                              174,
                                                              47,
                                                              0.82))),
                                              onPressed: () {
                                                Navigator.of(context).pop();
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
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Add to cart",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 60, 60, 60)),
                              ),
                              Icon(
                                Icons.badge,
                                size: 29,
                                color: Color.fromARGB(255, 60, 60, 60),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )
          //row
          //column
          //text
          //text
          //column
          //text
          //text
          //text
          //row
          //column
          //text
          //text
          //column
          //text
          //row
          //button/OnClickedContainer
        ],
      ),
    );
  }
}
