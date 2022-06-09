import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class fun {
  static List? data;
  static int? day;
  static bool? check;
  static bool test = false;
  static bool a = false, b = false, c = false, d = false;
  static bool noscore = false;
  static bool shortname = true;
  static bool internet = false;

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

  static Future<List> getdata() async {
    internet = await checkInternet();
    if (internet == true) {
      var res = await http.get(Uri.parse(
          'https://api.cricapi.com/v1/currentMatches?apikey=95c00616-5fb8-49ba-b4dc-4a9a830a9872&offset=0'));
      var map = json.decode(res.body);
      data = map['data'];
      return map['data'];
    } else {
      Fluttertoast.showToast(msg: 'You are currently Offline');
      return [];
    }
  }

  static Future refresh() async {
    print('hi-------');
    await getdata();
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
    //print(test.toString());
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
