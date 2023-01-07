import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mera_mann/model/get_data.dart';

class DiagnosisPage extends StatefulWidget {
  const DiagnosisPage({super.key});

  @override
  State<DiagnosisPage> createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  final TextEditingController _controller = TextEditingController();
  late String isDepressed;
  @override
  void initState() {
    super.initState();
    isDepressed = "";
  }

  final currentUser = FirebaseAuth.instance.currentUser;
  Future<void> addDianosis() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .update({
        'Diagonsis': FieldValue.arrayUnion([isDepressed])
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error, please try again later'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curr = FirebaseAuth.instance;

    const spinkit = SpinKitRipple(
      color: Color.fromRGBO(0, 99, 219, 1),
      size: 50.0,
    );

    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .where('Email', isEqualTo: curr.currentUser?.email)
          .snapshots(),
      builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return ListView(children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(12, 205, 163, 1),
                      Color.fromRGBO(193, 252, 211, 1)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset(
                            'asset/mera-mann-high-resolution-logo-color-on-transparent-background.png'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "So How have you been feeling lately?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 700,
                        margin: const EdgeInsets.all(12),
                        height: 5 * 24.0,
                        child: TextField(
                          controller: _controller,
                          maxLines: 20,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          maxLength: 1200,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: TextButton(
                          onPressed: () async {
                            var data = await FetchData().getData(
                              _controller.text,
                            );
                            var decodedData = jsonDecode(data);
                            setState(() {
                              isDepressed = decodedData['isDepressed'];
                            });
                            if (isDepressed == "Depressed") {
                              addDianosis();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(0, 99, 219, 1),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "You are $isDepressed",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ))
          ]);
        } else {
          return spinkit;
        }
      }),
    ));
  }
}
