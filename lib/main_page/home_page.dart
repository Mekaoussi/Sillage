import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:seanotes/cart_page/cart_page.dart';
import 'package:seanotes/log_in_out_/auth_service.dart';
import 'package:seanotes/log_in_out_/log_in_page.dart';
import 'package:seanotes/main_page/grid_item.dart';
import 'package:seanotes/product_page/product_page.dart';
import 'package:seanotes/providers/cart_items_provider.dart';

import 'package:seanotes/providers/products_provider.dart';
import 'package:seanotes/main_page/popular_item.dart';
import 'package:seanotes/main_page/newest_item.dart';
import 'package:seanotes/tabs_values.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String ishigh;
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    ishigh = tabs[0];
    Future.microtask(() => Provider.of<ProductProvider>(context, listen: false)
        .fetchProductData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 0, left: 25, right: 25, top: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            authService.removeToken();
                            Navigator.pushReplacement(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LogIN(), // Replace with your target page widget
                              ),
                            );
                          },
                          child: const ImageIcon(
                            AssetImage('assets/icons/logout.png'),
                            color: Color.fromARGB(255, 248, 120, 84),
                            size: 45,
                          )),
                      const Row(
                        children: [
                          ImageIcon(
                            AssetImage('assets/icons/sillage.png'),
                            color: Color.fromARGB(255, 240, 236, 229),
                            size: 45,
                          ),
                          Text(
                            "Sillage",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ),
                                fontFamily: "adamina"),
                          ),
                        ],
                      ),
                      Consumer<CartItemsprovider>(
                          builder: (context, cartitemProvider, child) {
                        final productData = cartitemProvider.cartitem;
                        return productData.isEmpty
                            ? GestureDetector(
                                onTap: () {
                                  _displayBottomSheet(context);
                                },
                                child: const ImageIcon(
                                  AssetImage('assets/icons/market.png'),
                                  color: Colors.white,
                                  size: 38,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  _displayBottomSheet(context);
                                },
                                child: Stack(
                                  children: [
                                    const ImageIcon(
                                      AssetImage('assets/icons/market.png'),
                                      color: Colors.white,
                                      size: 38,
                                    ),
                                    Positioned(
                                        left: 14,
                                        bottom: 15,
                                        child: CircleAvatar(
                                          radius: 12,
                                          child: Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)),
                                              color: Color.fromARGB(
                                                  200, 255, 0, 0),
                                            ),
                                            child: Center(
                                              child: Text(
                                                (context
                                                        .read<
                                                            CartItemsprovider>()
                                                        .countitems)
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 220, 220, 220)),
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              );
                      })
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        fontFamily: "lato",
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 240, 240, 242),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(120, 7, 239, 239),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tabs.length,
                      itemBuilder: (context, index) {
                        final iterat = tabs[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                ishigh = iterat;
                              });
                            },
                            child: Chip(
                              side: const BorderSide(
                                  width: 0,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              padding: const EdgeInsets.all(0),
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 0, 0),
                              label: Text(
                                iterat,
                                style: TextStyle(
                                  color: ishigh == iterat
                                      ? Colors.white
                                      : const Color.fromARGB(
                                          255, 100, 100, 100),
                                  fontSize: 18,
                                  fontFamily: "lato",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Color.fromARGB(255, 240, 240, 242),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 34, bottom: 0, left: 0, right: 0),
                  child: ishigh == tabs[0]
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Popular',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                            color:
                                                Color.fromARGB(255, 12, 12, 12),
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' Collection',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color:
                                                Color.fromARGB(255, 90, 90, 90),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Consumer<ProductProvider>(
                                builder: (context, productProvider, child) {
                                  final productData =
                                      productProvider.productData;
                                  if (productData == null) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  return SizedBox(
                                    height: 300,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productData
                                          .homePopularProducts.length,
                                      itemBuilder: (context, index) {
                                        final product = productData
                                            .homePopularProducts[index];

                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductPage(
                                                          id: product.id,
                                                          brand: product.brand,
                                                          name: product.name,
                                                          price: product.price
                                                              .toString(),
                                                          desc: product
                                                              .description,
                                                          consentration: product
                                                              .concentration,
                                                          image:
                                                              product.imageURL,
                                                        )));
                                          },
                                          child: PopularItem(
                                            image: product.imageURL,
                                            name: product.name,
                                            consentration:
                                                product.concentration,
                                            price: product.price,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Newest',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                            color:
                                                Color.fromARGB(255, 12, 12, 12),
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' Collection',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color:
                                                Color.fromARGB(255, 90, 90, 90),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Consumer<ProductProvider>(
                                builder: (context, productProvider, child) {
                                  final productData =
                                      productProvider.productData;
                                  if (productData == null) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  return Column(
                                    children: productData.homeNewestProducts
                                        .map((product) => GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProductPage(
                                                              id: product.id,
                                                              brand:
                                                                  product.brand,
                                                              name:
                                                                  product.name,
                                                              price: product
                                                                  .price
                                                                  .toString(),
                                                              desc: product
                                                                  .description,
                                                              consentration: product
                                                                  .concentration,
                                                              image: product
                                                                  .imageURL,
                                                            )));
                                              },
                                              child: NewestItem(
                                                image: product.imageURL,
                                                name: product.name,
                                                consentration:
                                                    product.concentration,
                                                price: product.price,
                                                sizeml: '100',
                                              ),
                                            ))
                                        .toList(),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      : Consumer<ProductProvider>(
                          builder: (context, productProvider, child) {
                            final productData = productProvider.productData;
                            if (productData == null) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return SizedBox(
                              height: 500,
                              width: double.infinity,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Two items per row
                                  mainAxisSpacing: 10.0, // Spacing between rows
                                  crossAxisSpacing:
                                      5.0, // Spacing between items
                                ),
                                itemCount: ishigh == tabs[1]
                                    ? productData.popularProducts
                                        .length // Use men data for Men tab
                                    : ishigh == tabs[2]
                                        ? productData.menProducts
                                            .length // Use women data for Women tab
                                        : ishigh == tabs[3]
                                            ? productData.womenProducts
                                                .length // Use popular data for Popular tab
                                            : productData.favoritesProducts
                                                .length, // Use favorites data for Favorites tab
                                itemBuilder: (context, index) {
                                  final product = ishigh == tabs[1]
                                      ? productData.popularProducts[
                                          index] // Use men data for Men tab
                                      : ishigh == tabs[2]
                                          ? productData.menProducts[
                                              index] // Use women data for Women tab
                                          : ishigh == tabs[3]
                                              ? productData.womenProducts[
                                                  index] // Use popular data for Popular tab
                                              : productData.favoritesProducts[
                                                  index]; // Use favorites data for Favorites tab
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ProductPage(
                                                    id: product.id,
                                                    brand: product.brand,
                                                    name: product.name,
                                                    price: product.price
                                                        .toString(),
                                                    desc: product.description,
                                                    consentration:
                                                        product.concentration,
                                                    image: product.imageURL,
                                                  )));
                                    },
                                    child: GridItem(
                                      image: product.imageURL,
                                      name: product.name,
                                      consentration: product.concentration,
                                      price: product.price,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        showDragHandle: true,
        isScrollControlled: true,
        context: context,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        isDismissible: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        builder: ((context) => const Cartpage()));
  }
}
