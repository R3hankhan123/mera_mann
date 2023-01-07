// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mera_mann/pages/home_page.dart';
import 'package:mera_mann/firebase/auth_methods.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  String name;
  String email;
  String password;
  Details(
      {super.key,
      required this.name,
      required this.email,
      required this.password});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emergencyNumbercontroller =
      TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  @override
  void dispose() {
    _phoneController.dispose();
    _emergencyNumbercontroller.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void signUP() async {
    String result = await Auth().SignUP(
      widget.email,
      widget.password,
      widget.name,
      _phoneController.text,
      _ageController.text,
      _emergencyNumbercontroller.text,
    );
    if (result == 'Signed Up Successfully') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(child: Text('Lets get some details about you')),
        elevation: 0.0,
        flexibleSpace: Container(
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
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(12, 205, 163, 1),
              Color.fromRGBO(193, 252, 211, 1)
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'asset/mera-mann-high-resolution-logo-color-on-transparent-background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          labelText: 'Emergency Contact Number',
                        ),
                        keyboardType: TextInputType.phone,
                        controller: _emergencyNumbercontroller,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          labelText: 'Age',
                        ),
                        keyboardType: TextInputType.number,
                        controller: _ageController,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            labelText: 'Phone Number',
                            hintText: 'Dont include country code'),
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 99, 219, 1),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (_emergencyNumbercontroller.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Please enter your emergency number"),
                              ),
                            );
                          } else if (_ageController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter your age"),
                              ),
                            );
                          } else if (_phoneController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter your phone number"),
                              ),
                            );
                          } else if (_phoneController.text ==
                              _emergencyNumbercontroller.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Emergency number and phone number cannot be same"),
                              ),
                            );
                          } else {
                            signUP();
                          }
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
