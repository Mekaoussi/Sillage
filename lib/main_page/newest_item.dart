import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewestItem extends StatelessWidget {
  final String image;
  final String name;
  final String consentration;
  final String sizeml;
  final int price;

  const NewestItem(
      {super.key,
      required this.image,
      required this.name,
      required this.consentration,
      required this.sizeml,
      required this.price});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(consentration,
                    style: const TextStyle(
                      fontSize: 17,
                    )),
                Text("$sizeml ml",
                    style: const TextStyle(
                      fontSize: 15,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Price",
                        style: TextStyle(
                          fontSize: 19,
                        )),
                    Text("\$ ${price.toString()}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
