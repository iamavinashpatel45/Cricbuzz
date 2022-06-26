import 'dart:typed_data';

class account {
  String? uid;
  String? num;
  String? email;
  String? image;
  String? password;
  String? fname;
  String? lname;
  static bool? login;
  static Uint8List? image_;
  static String? image_2;
  static String? uid_;
  static String? email_;
  static String? num_;
  static String? password_;
  static String? fname_;
  static String? lname_;

  account(
      {this.uid,
      this.image,
      this.num,
      this.email,
      this.password,
      this.fname,
      this.lname});

  account.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    image = json['image'];
    num = json['num'];
    email = json['email'];
    password = json['password'];
    fname = json['fname'];
    lname = json['lname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['image'] = this.image;
    data['num'] = this.num;
    data['email'] = this.email;
    data['password'] = this.password;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    return data;
  }
}

class list {
  static List<String> notification_list=[];
}
