import 'package:flutter/material.dart';
import 'package:seanotes/log_in_out_/auth_service.dart';
import 'package:seanotes/log_in_out_/feild.dart';
import 'package:seanotes/log_in_out_/sign_up_page.dart';
import 'package:seanotes/main_page/home_page.dart';

class LogIN extends StatefulWidget {
  const LogIN({super.key});
  @override
  State createState() => _MadeState();
}

class _MadeState extends State {
  String email = "";
  String pw = "";
  AuthService authService = AuthService();

  final TextEditingController emailText = TextEditingController();
  final TextEditingController pwText = TextEditingController();

  @override
  void dispose() {
    emailText.dispose();
    pwText.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    email = emailText.text;
                    pw = pwText.text;
                    bool x = await authService.logincall(email, pw);
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
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: const Color.fromRGBO(219, 174, 47, 0.82),
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  child: const Text("LOG IN "),
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
                            const SignUp(), // Replace with your target page widget
                      ),
                    );
                  },
                  child: const Text(
                    "Sign Up ?",
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
    );
  }
}
