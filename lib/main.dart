import 'package:cricket/fun/fun.dart';
import 'package:cricket/livematch/live_score.dart';
import 'package:cricket/login/account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splash(),
  ));
}

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  gohome() async {
    fun.internet = await fun.checkInternet();
    if (FirebaseAuth.instance.currentUser==null) {
      account.login=false;
    }
    else
      {
        FirebaseFirestore.instance.collection('user').get().then((value) => {
          account.login = true,
          //account.email_={value['email']},
        });
      }
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => live_score()),
    );
  }

  @override
  void initState() {
    gohome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 180, 137),
      body: Center(
        child: Image.asset('asstes/green_logo.png'),
      ),
    );
  }
}
