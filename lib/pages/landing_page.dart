// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mera_mann/pages/login_page.dart';
import 'package:mera_mann/pages/signup_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(12, 205, 163, 1),
              Color.fromRGBO(193, 252, 211, 1)
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const Text(
                    "Mera Mann",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Text(
                      "Home",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    height: 40,
                    child: MaterialButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Text(
                        " Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 40,
                    child: MaterialButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Text(
                        " Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(right: 100),
                        child: Text(
                          "What is Mera Mann?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: 500,
                        height: 300,
                        child: Text(
                          "Most people know they can exercise, eat well, sleep, and stay hydrated to take care of their physical health. But it’s less common for people to pay attention to their mental health.We are helping people by providing a platform where they can express their symptoms and get help accordingly. We believe to remove the stigma around the mental health we must have open communication about it.Our platform will make people learn the importance of mental health and things they can do to keep it well.By making mental healthcare more accessible we plan to impact lives of millions of people.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 300),
                        child: SizedBox(
                          height: 50,
                          width: 100,
                          child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()));
                              },
                              color: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: const Text("Get Started")),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 500,
                  ),
                  const SizedBox(
                    width: 400,
                    height: 500,
                    child: Image(
                        image: AssetImage(
                            "asset/mera-mann-high-resolution-logo-color-on-transparent-background.png")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
