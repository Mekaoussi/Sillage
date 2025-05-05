import 'package:flutter/material.dart';

class Feild extends StatelessWidget {
  final String fielddata;
  final IconData fieldicon;
  // ignore: prefer_typing_uninitialized_variables
  final ispw;
  final TextEditingController controller;
  const Feild(
      {super.key,
      required this.fielddata,
      required this.fieldicon,
      required this.ispw,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: 300,
        child: TextField(
          cursorColor: const Color.fromRGBO(219, 174, 47, 0.82),
          controller: controller,
          obscureText: ispw,
          style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(fieldicon),
            prefixIconConstraints: const BoxConstraints(minWidth: 40),
            prefixIconColor: const Color.fromRGBO(255, 220, 174, 48),
            hintText: fielddata,
            hintStyle: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.6),
              fontSize: 17,
            ),
            filled: true,
            fillColor: const Color.fromRGBO(20, 20, 20, 1),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(11)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(219, 174, 47, 0.82),
              ),
              borderRadius: BorderRadius.all(Radius.circular(11)),
            ),
          ),
        ),
      ),
    );
  }
}
