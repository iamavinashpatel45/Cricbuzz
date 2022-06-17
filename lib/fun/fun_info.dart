import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:cricket/livescore/info/json_info.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class fun_info{
  static String basestring =
      'https://api.cricapi.com/v1/match_squad?apikey=f43ff17a-89d5-4d63-8833-c3d7552f1293&id=';
  static String basestring2 =
      'https://api.cricapi.com/v1/match_squad?apikey=bc403c2e-6cc9-435f-9a88-b527c106b07c&id=';
  static String basestring3 =
      'https://api.cricapi.com/v1/match_squad?apikey=1fb77abf-7bce-4039-a199-6a805660e969&id=';
  static String basestring4 =
      'https://api.cricapi.com/v1/match_squad?apikey=f43ff17a-89d5-4d63-8833-c3d7552f1293&id=';
  static String? link;
  static bool internet = false;
  static var map;
  static var data;


  static checkInternet() async {
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

  static getdata(String link) async {
    internet = await checkInternet();
    if (internet == true) {
      var res = await http.get(Uri.parse(basestring + link));
      map = json.decode(res.body);
      if (json_info.fromJson(map).data == null) {
        var res = await http.get(Uri.parse(basestring2 + link));
        map = json.decode(res.body);
        if (json_info.fromJson(map).data == null) {
          var res = await http.get(Uri.parse(basestring3 + link));
          map = json.decode(res.body);
          if (json_info.fromJson(map).data == null) {
            var res = await http.get(Uri.parse(basestring4 + link));
            map = json.decode(res.body);
            print('4');
            data = json_info.fromJson(map).data;
          } else {
            print('3');
            data = json_info.fromJson(map).data;
          }
        } else {
          print('2');
          data = json_info.fromJson(map).data;
        }
      } else {
        print('1');
        data = json_info.fromJson(map).data;
      }
    } else {
      Fluttertoast.showToast(msg: 'You are currently Offline');
    }
  }
}