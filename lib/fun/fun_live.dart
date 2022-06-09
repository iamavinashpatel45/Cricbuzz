import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class fun_live {
  static bool internet = false;
  static int? day;
  static bool? check;
  static bool test = false;
  static bool a = false,
      b = false,
      c = false,
      d = false;
  static bool noscore = false;
  static bool shortname = true;
  static List? scorecard;
  static List? score;


  static String basestring =
      'https://api.cricapi.com/v1/match_scorecard?apikey=95c00616-5fb8-49ba-b4dc-4a9a830a9872&id=';

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

  static Future<List> getdata(String link) async {
    internet = await checkInternet();
    print(link);
    if (internet == true) {
      var res = await http.get(Uri.parse(basestring + link));
      var map = json.decode(res.body);
      //var map2=json.decode(map['data'].body);
      //print(map['data']);
      scorecard=map['data']['scorecard'];
      checktest();
      short();
      check_score();
      return map['data'];
    } else {
      Fluttertoast.showToast(msg: 'You are currently Offline');
      print('avinash patel');
      return [];
    }
  }


  static checktest() {
    a = false;
    b = false;
    c = false;
    d = false;
    test = false;
    int z = data![0]['score']?.length;
    if (data![0]['matchType'] == 'test') {
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

  static short() {
    shortname = true;
    if (data![0]['teamInfo'][0]['shortname'] == null ||
        data![0]['teamInfo'][1]['shortname'] == null) {
      shortname = false;
    }
  }

  static check_score() {
    if (noscore == false) {
      var string = data![0]['score'][0]['inning'];
      check = string.contains(data![0]['teamInfo'][0]['name']);
    }
  }
}
