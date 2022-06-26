import 'package:cricket/fun/fun_start.dart';
import 'package:cricket/livematch/live_score.dart';
import 'package:cricket/login/account.dart';
import 'package:cricket/login/login_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool showicon = false;
  String? email;
  String? password;

  homepage()async{
    account.login = true;
    await fun_start.getdate_2();
    Navigator.pop(
        context,
        MaterialPageRoute(
            builder: (context) =>
                live_score()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 180, 137),
        title: Text('Sign Up'),
      ),
      //backgroundColor: Color.fromARGB(255, 0, 180, 137),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 50,
              // ),
              // Text(
              //   'Sign in',
              //   style: TextStyle(
              //     fontWeight: FontWeight.w500,
              //     color: Colors.black,
              //     fontSize: 40,
              //   ),
              // ),
              SizedBox(
                height: 60,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value?.contains('@') == false ||
                            value?.contains('.') == false) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                      maxLines: 1,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        hintText: 'Enter your email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      maxLines: 1,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    showicon == false
                        ? ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                showicon = true;
                                setState(() {});
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: email!, password: password!);
                                  FirebaseAuth.instance
                                      .authStateChanges()
                                      .listen((User? user) {
                                    if (user == null) {
                                      showicon = false;
                                      Fluttertoast.showToast(
                                          msg: 'Somethig Worng');
                                    } else {
                                      homepage();
                                    }
                                  });
                                } on FirebaseAuthException catch (e) {
                                  showicon = false;
                                  setState(() {});
                                  switch (e.code) {
                                    case "invalid-email":
                                      Fluttertoast.showToast(
                                          msg: 'invalid-email');
                                      break;
                                    case "wrong-password":
                                      Fluttertoast.showToast(
                                          msg: 'Wrong-password');
                                      break;
                                    default:
                                      Fluttertoast.showToast(msg: e.toString());
                                  }
                                } catch (e) {
                                  showicon = false;
                                  setState(() {});
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 0, 180, 137),
                              padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                            ),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                        : CircularProgressIndicator(
                            color: Color.fromARGB(255, 0, 180, 137),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Forget password?'),
                        TextButton(
                          onPressed: () {
                            showicon = false;
                            setState(() {});
                            if (email?.contains('@') == true ||
                                email?.contains('.') == true) {
                              FirebaseAuth.instance
                                  .sendPasswordResetEmail(email: email!)
                                  .then((value) => Fluttertoast.showToast(
                                      msg:
                                          'Password Reset mail send to your Email'))
                                  .catchError((e) => Fluttertoast.showToast(
                                      msg: e.toString()));
                            } else {
                              Fluttertoast.showToast(msg: "Wrong Email");
                            }
                          },
                          child: Text(
                            'Reset Password',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not registered yet?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Create an account',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
