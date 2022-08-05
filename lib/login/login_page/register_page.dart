import 'dart:io';
import 'package:cricket/livematch/live_score.dart';
import 'package:cricket/login/account.dart';
import 'package:cricket/login/login_page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool showicon = false;
  String? imagestr;
  String? email;
  String? password;
  String? num;
  String? fname;
  String? lname;
  File? image;

  imageFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {
        imageconvert();
      });
    }
  }

  imageFromCamera() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {
        imageconvert();
      });
    }
  }

  Future<void> uploaddata() async {
    SharedPreferences add = await SharedPreferences.getInstance();
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance
        .collection('userdata')
        .doc(uid)
        .set(account(
                uid: uid,
                email: email,
                password: password,
                image: imagestr,
                num: num,
                fname: fname,
                lname: lname)
            .toJson())
        .then((value) => {
              account.login = true,
              account.email_ = email!,
              account.num_ = num,
              account.password_ = password,
              account.fname_ = fname,
              account.lname_ = lname,
              add.setBool("login", true),
              add.setString("email", email!),
              add.setString('image', imagestr!),
              add.setString("num", num!),
              add.setString("pass", password!),
              add.setString("fname", fname!),
              add.setString("lname", lname!),
            })
        .catchError((Object error) => {
              account.login = false,
              Fluttertoast.showToast(msg: 'Something Wrong,Try Latter'),
            });
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => live_score()),
    );
  }

  imageconvert() async {
    account.image_ = File(image!.path).readAsBytesSync();
    imagestr = String.fromCharCodes(account.image_!);
  }

  showbottom() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext contet) {
          return SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profile photo',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        image == null
                            ? Container()
                            : InkWell(
                                onTap: () {
                                  image = null;
                                  account.image_ = null;
                                  setState(() {});
                                },
                                child: Icon(Icons.delete))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                imageFromCamera();
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Color.fromARGB(255, 0, 180, 137),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Camera'),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                imageFromGallery();
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Icon(
                                  Icons.image,
                                  color: Color.fromARGB(255, 0, 180, 137),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text('Gallery'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 180, 137),
        title: Text('Sign Up'),
      ),
      //backgroundColor: Color.fromARGB(255, 0, 180, 137),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                              height: 150,
                              width: 200,
                              child: image == null
                                  ? InkWell(
                                      onTap: () {
                                        showbottom();
                                      },
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('asstes/profile.jpg'),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        showbottom();
                                      },
                                      child: //Image.memory(File(image!.path).readAsBytesSync()),
                                          CircleAvatar(
                                        backgroundImage:
                                            MemoryImage(account.image_!),
                                      ),
                                    )),
                          Positioned(
                              bottom: 12,
                              right: 20,
                              child: InkWell(
                                onTap: () {
                                  showbottom();
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 0, 180, 137),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              fname = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first Name';
                              }
                              return null;
                            },
                            maxLines: 1,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              hintText: 'First name',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              lname = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last Name';
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.black),
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              hintText: 'Last name',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        num = value;
                      },
                      validator: (value) {
                        if (value?.length != 10) {
                          return 'Invalid Number';
                        }
                        return null;
                      },
                      maxLines: 1,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        hintText: 'Enter your number',
                        prefixIcon: Icon(
                          Icons.phone,
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
                      keyboardType: TextInputType.emailAddress,
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
                                if (account.image_ != null) {
                                  showicon = true;
                                  setState(() {});
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: email!, password: password!);
                                    FirebaseAuth.instance
                                        .authStateChanges()
                                        .listen((User? user) async {
                                      if (user == null) {
                                        showicon = false;
                                        Fluttertoast.showToast(
                                            msg: 'Somethig Worng');
                                      } else {
                                        await uploaddata();
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
                                      case "weak-password":
                                        Fluttertoast.showToast(
                                            msg: 'Weak-password');
                                        break;
                                      case "email-already-in-use":
                                        Fluttertoast.showToast(
                                            msg: 'email-already-in-use');
                                        break;
                                      default:
                                      //Fluttertoast.showToast(msg: e.toString());
                                    }
                                  } catch (e) {
                                    showicon = false;
                                    setState(() {});
                                  }
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Select Profile Image');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 0, 180, 137),
                              padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                            ),
                            child: Text(
                              'Sign Up',
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
                        Text('Already registered?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
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
