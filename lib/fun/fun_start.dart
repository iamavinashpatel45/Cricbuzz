import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket/login/account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class fun_start {
  static Uint8List? unit8List;

  static Image(String str) {
    try {
      account.image_2 = str;
      account.image_ = Uint8List.fromList(str.codeUnits);
    } catch (e) {}
  }

  static Future getdata() async {
    if (await FirebaseAuth.instance.currentUser == null) {
      account.login = false;
    } else {
      SharedPreferences get = await SharedPreferences.getInstance();
      account.email_ = get.getString("email");
      account.fname_ = get.getString("fname");
      Image(get.getString("image")!);
      account.lname_ = get.getString("lname");
      account.num_ = get.getString("num");
      account.password_ = get.getString("pass");
    }
  }

  static getdate_2() async {
    account.login = true;
    account.uid_ = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance
        .collection('userdata')
        .doc(account.uid_)
        .get()
        .then((value) => {
              account.email_ = value.data()!['email'],
              account.fname_ = value.data()!['fname'],
              Image(value.data()!['image']),
              account.lname_ = value.data()!['lname'],
              account.num_ = value.data()!['num'],
              account.password_ = value.data()!['password'],
            });
    SharedPreferences add=await SharedPreferences.getInstance();
    add.setBool("login", true);
    add.setString("email", account.email_!);
    add.setString('image', account.image_2!);
    add.setString("num", account.num_!);
    add.setString("pass", account.password_!);
    add.setString("fname", account.fname_!);
    add.setString("lname", account.lname_!);
  }
}
