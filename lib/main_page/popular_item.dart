import 'package:flutter/material.dart';


class PopularItem extends StatelessWidget {
  final String image;
  final String name;
  final String consentration;
  final int price;

  const PopularItem(
      {super.key,
      required this.image,
      required this.name,
      required this.consentration,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 11, right: 15, top: 15, bottom: 13.5),
      child: Container(
        height: 275,
        width: 205,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //image
            SizedBox(
              height: 205,
              width: 205,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  )),
            ),
            //row
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //first column
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 30, 30, 30)),
                        ),
                        Text(
                          consentration,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 90, 90, 90)),
                        ),
                      ],
                    ),
                  ),
                  //second column
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 6),
                    child: Column(
                      children: [
                        const Text(
                          "Price",
                          style: TextStyle(
                              color: Color.fromARGB(255, 60, 60, 60),
                              fontSize: 17),
                        ),
                        Text(
                          "\$$price",
                          style: const TextStyle(
                              fontSize: 19.9,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 15, 15, 15)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
