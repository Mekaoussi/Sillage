import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seanotes/log_in_out_/sign_up_page.dart';
import 'package:seanotes/providers/cart_items_provider.dart';
import 'package:seanotes/providers/products_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartItemsprovider()),
      ],
      child: const Seanotes(),
    ),
  );
}

class Seanotes extends StatelessWidget {
  const Seanotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      title: "SeaNotes",
      home: const SignUp(),
    );
  }
}
