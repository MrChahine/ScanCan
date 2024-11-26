import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Input Controller

  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Image.asset("assets/images/doctor.png"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: 290,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: mailController,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.mail,
                                color: Colors.purple[800],
                              ),
                              labelText: "Email",
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: 290,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              suffix: Icon(
                                Icons.visibility,
                                color: Colors.purple[900],
                              ),
                              icon: Icon(
                                Icons.lock,
                                color: Colors.purple[800],
                                size: 19,
                              ),
                              labelText: 'Password',
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.purple),
                          padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 120, vertical: 10)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27))),
                        ),
                        child: const Text(
                          "login",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(180, 0, 0, 0)),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an accout? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, "/signup");
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      SizedBox(
                        width: 277,
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.6,
                                color: Colors.purple[100],
                              ),
                            ),
                            Text(
                              'OR',
                              style: TextStyle(
                                color: Colors.purple[300],
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.6,
                                color: Colors.purple[100],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 145),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: Colors.purple, width: 1)),
                              child: SvgPicture.asset(
                                "assets/icons/google-plus.svg",
                                color: Colors.purple[400],
                                height: 27,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
