class account {
  static bool? login;
  static String? uid_;
  static String email_='';
  static String? password_;
  static String? name_;
  String? uid;
  String? email;
  String? password;
  String? name;

  account({ this.uid, this.email, this.password, this.name});

  account.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    return data;
  }
}
