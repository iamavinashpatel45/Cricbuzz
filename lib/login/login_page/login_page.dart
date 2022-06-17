import 'package:cricket/login/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../livematch/live_score.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  bool check = true;
  bool signin = false;
  bool showicon = false;
  String? email, password;
  final _fromkey = GlobalKey<FormState>();

  con(BuildContext Context) async {
    if (_fromkey.currentState!.validate()) {
      if (signin == false) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email!, password: password!);
          FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if (user == null) {
              showicon = false;
              Fluttertoast.showToast(msg: 'Somethig Worng');
            } else {
              account.login = true;
              account.email_ = email!;
              account.password_ = password;
              account.name_ = email?.split('@').first;
              FirebaseFirestore.instance.collection('user').add(account(
                      uid: user.uid,
                      email: email,
                      password: password,
                      name: email?.split('@').first)
                  .toJson());
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => live_score()));
            }
          });
        } on FirebaseAuthException catch (e) {
          showicon = false;
          Fluttertoast.showToast(msg: e.toString());
        } catch (e) {
          showicon = false;
        }
      } else {
        try {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email!, password: password!);
          FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if (user == null) {
              showicon = false;
              Fluttertoast.showToast(msg: 'Somethig Worng');
            } else {
              account.login = true;
              account.email_ = email!;
              account.password_ = password;
              account.name_ = email?.split('@').first;
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => live_score()));
            }
          });
        } on FirebaseAuthException catch (e) {
          showicon = false;
          Fluttertoast.showToast(msg: e.toString());
        } catch (e) {
          showicon = false;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 180, 137),
        title: Text('Log In'),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8),
                  child: InkWell(
                      onTap: () {
                        check = !check;
                        setState(() {
                          print(check);
                        });
                      },
                      child: check == true
                          ? Icon(Icons.check_box)
                          : Icon(Icons.check_box_outline_blank)),
                ),
                Expanded(
                    child: Text(
                        "I agree with the Terms of Use & Privacy Policy of Cricbuzz")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                  onTap: () {
                    showicon = true;
                    setState(() {
                      con(context);
                    });
                  },
                  child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 180, 137),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                          child: showicon == false
                              ? Text(
                                  "CONTINUE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              : CircularProgressIndicator(
                                  color: Colors.white,
                                )))),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: _fromkey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  signin == false ? 'Sign Up' : 'Sign In',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Your Email Id',
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value?.contains('@') == false ||
                        value?.contains('.') == false) {
                      return 'Invalid Email';
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: 'Enter Email Id'),
                ),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Password';
                    }
                    if (value.length < 6) {
                      return 'Length Must be Grater than 6';
                    }
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.privacy_tip),
                      hintText: 'Enter Password'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          print(signin);
                          signin = !signin;
                          print(signin);
                          setState(() {});
                        },
                        child: Text(
                            signin == false
                                ? 'Already have an account?'
                                : 'Create acoount',
                            style: TextStyle(color: Colors.blue)),
                      )
                    ],
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
