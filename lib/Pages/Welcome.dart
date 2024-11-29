import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      "Welcome to ScanCan",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: Image.asset("assets/images/cancer.png"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.purple),
                        padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 99, vertical: 10)),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: const Text(
                        "login",
                        style: TextStyle(
                            fontSize: 24, color: Color.fromARGB(180, 0, 0, 0)),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.purple[100]),
                        padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 95, vertical: 13)),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(fontSize: 17, color: Colors.grey[850]),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                child: Image.asset(
                  'assets/images/main_top.png',
                  width: 90,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Image.asset(
                  'assets/images/main_bottom.png',
                  width: 111,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
