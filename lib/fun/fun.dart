import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class fun {
  static List? data;
  static List? data2;
  static int? day;
  static bool? check;
  static bool status = false;
  static bool test = false;
  static bool a = false, b = false, c = false, d = false;
  static bool noscore = false;
  static bool shortname = true;
  static bool internet = false;

  static String s1 =
      'https://api.cricapi.com/v1/series?apikey=95c00616-5fb8-49ba-b4dc-4a9a830a9872&offset=0';
  static String s2 =
      'https://api.cricapi.com/v1/series?apikey=bc403c2e-6cc9-435f-9a88-b527c106b07c&offset=0';
  static String s3 =
      'https://api.cricapi.com/v1/series?apikey=1fb77abf-7bce-4039-a199-6a805660e969&offset=0';
  static String s4 =
      'https://api.cricapi.com/v1/series?apikey=f43ff17a-89d5-4d63-8833-c3d7552f1293&offset=0';

  static Future<bool> checkInternet() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }


  static getdata() async {
    if (internet == true) {
      var res = await http.get(Uri.parse(
          'https://api.cricapi.com/v1/currentMatches?apikey=95c00616-5fb8-49ba-b4dc-4a9a830a9872&offset=0'));
      var map = json.decode(res.body);
      data = map['data'];
      print('1');
      if (data == null) {
        var res = await http.get(Uri.parse(
            'https://api.cricapi.com/v1/currentMatches?apikey=bc403c2e-6cc9-435f-9a88-b527c106b07c&offset=0'));
        var map = json.decode(res.body);
        data = map['data'];
        print('1');
        if (data == null) {
          var res = await http.get(Uri.parse(
              'https://api.cricapi.com/v1/currentMatches?apikey=1fb77abf-7bce-4039-a199-6a805660e969&offset=0'));
          var map = json.decode(res.body);
          data = map['data'];
          print('1');
          if (data == null) {
            var res = await http.get(Uri.parse(
                'https://api.cricapi.com/v1/currentMatches?apikey=f43ff17a-89d5-4d63-8833-c3d7552f1293&offset=0'));
            var map = json.decode(res.body);
            data = map['data'];
            print('1');
          } else {
            print('3');
            data = map['data'];
          }
        } else {
          print('2');
          data = map['data'];
        }
      } else {
        print('1');
        data = map['data'];
      }
    } else {
      Fluttertoast.showToast(msg: 'You are currently Offline');
      return [];
    }
  }

  static checkstatus(int index) {
    status = false;
    var string = data![index]['status'];
    status = string.contains('won');
  }


  static getdata_2() async {
    var res = await http.get(Uri.parse(s1));
    var map = json.decode(res.body);
    data2 = map['data'];
    print('1');
    if (data2 == null) {
      var res = await http.get(Uri.parse(s2));
      var map = json.decode(res.body);
      data2 = map['data'];
      if (data2 == null) {
        var res = await http.get(Uri.parse(s3));
        var map = json.decode(res.body);
        data2 = map['data'];
        if (data2 == null) {
          var res = await http.get(Uri.parse(s3));
          var map = json.decode(res.body);
          data2 = map['data'];
        } else {
          print('3');
          data2 = map['data'];
        }
      } else {
        print('2');
        data2 = map['data'];
      }
    }
  }

  static checktest(int index) {
    a = false;
    b = false;
    c = false;
    d = false;
    test = false;
    int z = data![index]['score']?.length;
    if (data![index]['matchType'] == 'test') {
      test = true;
    }
    if (z == 0) {
      noscore = true;
    } else if (z == 1) {
      a = true;
    } else if (z == 2) {
      a = true;
      b = true;
    } else if (z == 3) {
      a = true;
      b = true;
      c = true;
    } else {
      a = true;
      b = true;
      c = true;
      d = true;
    }
  }

  static short(int index) {
    shortname = true;
    if (data![index]['teamInfo'][0]['shortname'] == null ||
        data![index]['teamInfo'][1]['shortname'] == null) {
      shortname = false;
    }
  }

  static check_score(int index) {
    if (noscore == false) {
      var string = data![index]['score'][0]['inning'];
      check = string.contains(data![index]['teamInfo'][0]['name']);
    }
  }

  static String? date(int index) {
    String mon = data![index]['date'].substring(5, 7);
    day = int.parse(data![index]['date'].substring(8, 10));
    if (mon == '01') {
      return 'Jan ';
    } else if (mon == '02') {
      return 'Feb ';
    } else if (mon == '00') {
      return 'Mar ';
    } else if (mon == '04') {
      return 'Arp ';
    } else if (mon == '05') {
      return 'May ';
    } else if (mon == '06') {
      return 'jun ';
    } else if (mon == '07') {
      return 'Jul ';
    } else if (mon == '08') {
      return 'Aug ';
    } else if (mon == '09') {
      return 'Sep ';
    } else if (mon == '10') {
      return 'Oct ';
    } else if (mon == '11') {
      return 'Nov ';
    } else if (mon == '12') {
      return 'Dec ';
    }
  }
}
