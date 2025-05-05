import 'package:flutter/material.dart';

import 'package:seanotes/log_in_out_/auth_service.dart';
import 'package:seanotes/log_in_out_/feild.dart';
import 'package:seanotes/log_in_out_/log_in_page.dart';
import 'package:seanotes/main_page/home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State createState() => _MadeState();
}

class _MadeState extends State {
  String result = "";
  bool loggedIn = false;
  String name = "";
  String email = "";
  String pw = "";
  AuthService authService = AuthService();

  void _loadToken() async {
    String? token = await authService.getToken();
    setState(() {
      result = token ?? "";
      print("result: $token");
      loggedIn = result == "" ? false : true;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  final TextEditingController nameText = TextEditingController();
  final TextEditingController emailText = TextEditingController();
  final TextEditingController pwText = TextEditingController();
  bool x = true;
  @override
  void dispose() {
    nameText.dispose();
    emailText.dispose();
    pwText.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loggedIn == false
        ? Scaffold(
            backgroundColor: const Color.fromARGB(255, 15, 15, 15),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 15, 15, 15),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage('assets/icons/sillage.png'),
                          color: Color.fromARGB(255, 240, 236, 229),
                          size: 55,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Sillage",
                          style: TextStyle(
                              fontSize: 40,
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
                    const SizedBox(
                      height: 100,
                    ),
                    Feild(
                      fielddata: "Enter Name",
                      fieldicon: Icons.account_box_rounded,
                      ispw: false,
                      controller: nameText,
                    ),
                    Feild(
                      fielddata: "Enter Email",
                      fieldicon: Icons.email,
                      ispw: false,
                      controller: emailText,
                    ),
                    Feild(
                      fielddata: "Enter Password",
                      fieldicon: Icons.password,
                      ispw: true,
                      controller: pwText,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextButton(
                        onPressed: () async {
                          name = nameText.text;
                          email = emailText.text;
                          pw = pwText.text;
                          bool x =
                              await authService.signupcall(name, email, pw);
                          if (x) {
                            Navigator.pushReplacement(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const HomePage(), // Replace with your target page widget
                              ),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor:
                              const Color.fromRGBO(219, 174, 47, 0.82),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        child: const Text("SIGN UP "),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LogIN(), // Replace with your target page widget
                            ),
                          );
                        },
                        child: const Text(
                          "Log In ?",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(219, 174, 47, 0.82)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : const HomePage();
  }
}
