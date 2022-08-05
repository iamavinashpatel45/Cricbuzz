import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket/livematch/live_score.dart';
import 'package:cricket/login/account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../account.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final _formKey = GlobalKey<FormState>();
  bool edit = false;
  bool update = false;

  String num = account.num_!;
  String fname = account.fname_!;
  String lname = account.lname_!;
  Uint8List image_ = account.image_!;
  File? image;
  String? imagestr = account.image_2;

  imageFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      imageconvert();
      setState(() {});
    }
  }

  imageFromCamera() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      imageconvert();
      setState(() {});
    }
  }

  imageconvert() async {
    image_ = File(image!.path).readAsBytesSync();
    imagestr = String.fromCharCodes(image_);
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
        title: Text('Profile'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: edit == false
                  ? InkWell(
                      onTap: () {
                        edit = true;
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_note,
                            size: 32,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Edit',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  : Container())
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                          height: 150,
                          width: 200,
                          child: InkWell(
                            onTap: () {
                              if (edit == true) {
                                showbottom();
                              }
                            },
                            child: //Image.memory(File(image!.path).readAsBytesSync()),
                                CircleAvatar(
                              backgroundImage: MemoryImage(image_),
                            ),
                          )),
                      Positioned(
                          bottom: 12,
                          right: 20,
                          child: InkWell(
                            onTap: () {
                              if (edit == true) {
                                showbottom();
                              }
                            },
                            child: edit == true
                                ? Container(
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
                                  )
                                : Container(),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person_rounded,size: 20,color: Colors.grey,),
                            Text(
                              'First Name',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Material(
                          elevation: 3,
                          child: edit == false
                              ? Container(
                                  height: 50,
                                  width:
                                      (MediaQuery.of(context).size.width - 80) /
                                          2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          account.fname_!,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  height: 50,
                                  width:
                                      (MediaQuery.of(context).size.width - 80) /
                                          2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
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
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      controller: TextEditingController()
                                        ..text = fname,
                                    ),
                                  ),
                                ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person_rounded,size: 20,color: Colors.grey,),
                            Text(
                              'Last Name',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Material(
                          elevation: 3,
                          child: edit == false
                              ? Container(
                                  height: 50,
                                  width:
                                      (MediaQuery.of(context).size.width - 80) /
                                          2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          account.lname_!,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  height: 50,
                                  width:
                                      (MediaQuery.of(context).size.width - 80) /
                                          2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
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
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      controller: TextEditingController()
                                        ..text = lname,
                                    ),
                                  ),
                                ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.phone,size: 20,color: Colors.grey,),
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Material(
                  elevation: 3,
                  child: edit == false
                      ? Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  account.num_!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              onChanged: (value) {
                                num = value;
                              },
                              maxLines: 1,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value?.length != 10) {
                                  return 'Invalid Number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              controller: TextEditingController()..text = num,
                            ),
                          ),
                        ),
                ),
                edit == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(Icons.email_rounded,size: 20,color: Colors.grey,),
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Material(
                            elevation: 3,
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width - 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      account.email_!,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: edit == false
                        ? ElevatedButton(
                            onPressed: () async {
                              FirebaseAuth.instance.signOut();
                              account.login = false;
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (Context) => live_score()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 0, 180, 137),
                              padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                            ),
                            child: Text(
                              'Log Out',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                        : update == false
                            ? ElevatedButton(
                                onPressed: () async {
                                  setState(() {});
                                  if (_formKey.currentState!.validate()) {
                                    if (account.image_ != null) {
                                      update = true;
                                      setState(() {});
                                      SharedPreferences add =
                                          await SharedPreferences.getInstance();
                                      await FirebaseFirestore.instance
                                          .collection('userdata')
                                          .doc(account.uid_)
                                          .update(account(
                                                  uid: account.uid_,
                                                  email: account.email_,
                                                  password: account.password_,
                                                  image: imagestr,
                                                  num: num,
                                                  fname: fname,
                                                  lname: lname)
                                              .toJson())
                                          .then((value) => {
                                                account.fname_ = fname,
                                                account.lname_ = lname,
                                                account.num_ = num,
                                                account.image_ = image_,
                                                add.setString("num", num),
                                                add.setString(
                                                    'image', imagestr!),
                                                add.setString("fname", fname),
                                                add.setString("lname", lname),
                                              })
                                          .catchError((Object error) {
                                        num = account.num_!;
                                        fname = account.fname_!;
                                        lname = account.lname_!;
                                        Fluttertoast.showToast(
                                            msg: 'Something Wrong,Try Latter');
                                      });
                                      update = false;
                                      edit = false;
                                      setState(() {});
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 0, 180, 137),
                                  padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                                ),
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                            : CircularProgressIndicator(
                                color: Color.fromARGB(255, 0, 180, 137),
                              ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
