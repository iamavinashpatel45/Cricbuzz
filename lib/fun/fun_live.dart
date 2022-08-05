import 'package:connectivity/connectivity.dart';
import 'package:cricket/livescore/json_score.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class fun_live {
  static bool internet = false;
  static var data;
  static bool status = false;
  static var map;
  static String basestring =
      'https://api.cricapi.com/v1/match_scorecard?apikey=95c00616-5fb8-49ba-b4dc-4a9a830a9872&id=';
  static String basestring2 =
      'https://api.cricapi.com/v1/match_scorecard?apikey=bc403c2e-6cc9-435f-9a88-b527c106b07c&id=';
  static String basestring3 =
      'https://api.cricapi.com/v1/match_scorecard?apikey=1fb77abf-7bce-4039-a199-6a805660e969&id=';
  static String basestring4 =
      'https://api.cricapi.com/v1/match_scorecard?apikey=f43ff17a-89d5-4d63-8833-c3d7552f1293&id=';
  static String basestring5 =
      'https://api.cricapi.com/v1/match_scorecard?apikey=ae34b124-da2b-4799-b32e-3d446b060130&id=';
  static String basestring6 =
      'https://api.cricapi.com/v1/match_scorecard?apikey=5c1bbce7-f4a2-4e51-be81-5c3e2f0e0177&id=';
  static String basestring7 =
      'https://api.cricapi.com/v1/match_scorecard?apikey=bf01a906-4de7-4480-aa69-1e4e48b6c568&id=';
  static String basestring8 =
      'https://api.cricapi.com/v1/match_scorecard?apikey=294e47ae-3b98-4095-8e3f-38a7ecf596a1&id=';
  static String basestring9 =
      'https://api.cricapi.com/v1/match_scorecard?apikey=666ea33c-e017-4b2c-807b-e000436bf17a&id=';
  static String basestring10 =
      'https://api.cricapi.com/v1/match_scorecard?apikey=3966c88a-09ff-41ac-8920-7e61ed0e1109&id=';
  static String basestring11 =
      'https://api.cricapi.com/v1/match_scorecard?apikey=decd3672-d637-491b-8644-369eae91b9eb&id=';

  static String? link;
  static int? day, blower = null;
  static bool? check;
  static bool test = false;
  static bool noscore = false;
  static bool shortname = true;
  static bool progressbar = true;

  static String? name(int index) {
    String str = fun_live.data.score[index].inning;
    str = str.split(' Inning').first;
    return str;
  }

  static short() {
    shortname = true;
    if (fun_live.data.teamInfo[0].shortname == null ||
        fun_live.data.teamInfo[0].shortname == null) {
      shortname = false;
    }
  }

  static int? checkblower() {
    int x = data.scorecard[data.score.length - 1].bowling.length;
    int y = 0;
    for (int i = 0; i < x; i++) {
      if (data.scorecard[data.score.length - 1].bowling[i].o
          .toString()
          .contains('.')) {
        blower = i;
        y = 1;
        return i;
      }
    }
    if (y == 1 && blower != null) {
      return blower;
    }
  }

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

  static Future<Object?> getdata(String link) async {
    internet = await checkInternet();
    if (internet == true) {
      var res = await http.get(Uri.parse(basestring + link));
      map = json.decode(res.body);
      if (json_score.fromJson(map).data == null) {
        var res = await http.get(Uri.parse(basestring2 + link));
        map = json.decode(res.body);
        if (json_score.fromJson(map).data == null) {
          var res = await http.get(Uri.parse(basestring3 + link));
          map = json.decode(res.body);
          if (json_score.fromJson(map).data == null) {
            var res = await http.get(Uri.parse(basestring4 + link));
            map = json.decode(res.body);
            if (json_score.fromJson(map).data == null) {
              var res = await http.get(Uri.parse(basestring5 + link));
              map = json.decode(res.body);
              if (json_score.fromJson(map).data == null) {
                var res = await http.get(Uri.parse(basestring6 + link));
                map = json.decode(res.body);
                if (json_score.fromJson(map).data == null) {
                  var res = await http.get(Uri.parse(basestring7 + link));
                  map = json.decode(res.body);
                  data = json_score.fromJson(map).data;
                } else {
                  data = json_score.fromJson(map).data;
                }
              } else {
                data = json_score.fromJson(map).data;
              }
            } else {
              data = json_score.fromJson(map).data;
            }
          } else {
            data = json_score.fromJson(map).data;
          }
        } else {
          data = json_score.fromJson(map).data;
        }
      } else {
        data = json_score.fromJson(map).data;
      }
      if (data == null) {
        var res = await http.get(Uri.parse(basestring8 + link));
        map = json.decode(res.body);
        if (json_score.fromJson(map).data == null) {
          var res = await http.get(Uri.parse(basestring9 + link));
          map = json.decode(res.body);
          if (json_score.fromJson(map).data == null) {
            var res = await http.get(Uri.parse(basestring10 + link));
            map = json.decode(res.body);
            if (json_score.fromJson(map).data == null) {
              var res = await http.get(Uri.parse(basestring11 + link));
              map = json.decode(res.body);
              data = json_score.fromJson(map).data;
            } else {
              data = json_score.fromJson(map).data;
            }
          } else {
            data = json_score.fromJson(map).data;
          }
        } else {
          data = json_score.fromJson(map).data;
        }
      } else {
        data = json_score.fromJson(map).data;
      }
    } else {
      Fluttertoast.showToast(msg: 'You are currently Offline');
    }
    checktest();
    checkstatus();
  }

  static String? date() {
    String mon = data.dateTimeGMT.substring(5, 7);
    day = int.parse(data.dateTimeGMT.substring(8, 10));
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

  static checkstatus() {
    status = false;
    var string = data.status;
    status = string.contains('won');
  }

  static checktest() {
    test = false;
    if (data.matchType == 'test') {
      test = true;
    }
  }
}
