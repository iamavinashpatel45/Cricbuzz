import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:cricket/livescore/info/json_info.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class fun_info {
  static String basestring =
      'https://api.cricapi.com/v1/match_squad?apikey=f43ff17a-89d5-4d63-8833-c3d7552f1293&id=';
  static String basestring2 =
      'https://api.cricapi.com/v1/match_squad?apikey=bc403c2e-6cc9-435f-9a88-b527c106b07c&id=';
  static String basestring3 =
      'https://api.cricapi.com/v1/match_squad?apikey=1fb77abf-7bce-4039-a199-6a805660e969&id=';
  static String basestring4 =
      'https://api.cricapi.com/v1/match_squad?apikey=f43ff17a-89d5-4d63-8833-c3d7552f1293&id=';
  static String basestring5 =
      'https://api.cricapi.com/v1/match_squad?apikey=ae34b124-da2b-4799-b32e-3d446b060130&id=';
  static String basestring6 =
      'https://api.cricapi.com/v1/match_squad?apikey=5c1bbce7-f4a2-4e51-be81-5c3e2f0e0177&id=';
  static String basestring7 =
      'https://api.cricapi.com/v1/match_squad?apikey=bf01a906-4de7-4480-aa69-1e4e48b6c568&id=';
  static String basestring8 =
      'https://api.cricapi.com/v1/match_squad?apikey=294e47ae-3b98-4095-8e3f-38a7ecf596a1&id=';
  static String basestring9 =
      'https://api.cricapi.com/v1/match_squad?apikey=666ea33c-e017-4b2c-807b-e000436bf17a&id=';
  static String basestring10 =
      'https://api.cricapi.com/v1/match_squad?apikey=3966c88a-09ff-41ac-8920-7e61ed0e1109&id=';
  static String basestring11 =
      'https://api.cricapi.com/v1/match_squad?apikey=decd3672-d637-491b-8644-369eae91b9eb&id=';

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
            if (json_info.fromJson(map).data == null) {
              var res = await http.get(Uri.parse(basestring5 + link));
              map = json.decode(res.body);
              if (json_info.fromJson(map).data == null) {
                var res = await http.get(Uri.parse(basestring6 + link));
                map = json.decode(res.body);
                if (json_info.fromJson(map).data == null) {
                  var res = await http.get(Uri.parse(basestring7 + link));
                  map = json.decode(res.body);
                  data = json_info.fromJson(map).data;
                } else {
                  data = json_info.fromJson(map).data;
                }
              } else {
                data = json_info.fromJson(map).data;
              }
            } else {
              data = json_info.fromJson(map).data;
            }
          } else {
            data = json_info.fromJson(map).data;
          }
        } else {
          data = json_info.fromJson(map).data;
        }
      } else {
        data = json_info.fromJson(map).data;
      }
    } else {
      Fluttertoast.showToast(msg: 'You are currently Offline');
    }
  }
}
