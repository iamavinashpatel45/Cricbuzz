import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class fun {
  static List? data;
  static List? data2;
  static int? day;
  static bool? reminder;
  static bool? check;
  static bool status = false;
  static bool test = false;
  static bool a = false, b = false, c = false, d = false;
  static bool noscore = false;
  static bool shortname = true;
  static bool internet = false;

  static String ss1 =
      'https://api.cricapi.com/v1/currentMatches?apikey=95c00616-5fb8-49ba-b4dc-4a9a830a9872&offset=0';
  static String ss2 =
      'https://api.cricapi.com/v1/currentMatches?apikey=bc403c2e-6cc9-435f-9a88-b527c106b07c&offset=0';
  static String ss3 =
      'https://api.cricapi.com/v1/currentMatches?apikey=1fb77abf-7bce-4039-a199-6a805660e969&offset=0';
  static String ss4 =
      'https://api.cricapi.com/v1/currentMatches?apikey=f43ff17a-89d5-4d63-8833-c3d7552f1293&offset=0';
  static String ss5 =
      'https://api.cricapi.com/v1/currentMatches?apikey=ae34b124-da2b-4799-b32e-3d446b060130&offset=0';
  static String ss6 =
      'https://api.cricapi.com/v1/currentMatches?apikey=5c1bbce7-f4a2-4e51-be81-5c3e2f0e0177&offset=0';
  static String ss7 =
      'https://api.cricapi.com/v1/currentMatches?apikey=bf01a906-4de7-4480-aa69-1e4e48b6c568&offset=0';
  static String ss8 =
      'https://api.cricapi.com/v1/currentMatches?apikey=294e47ae-3b98-4095-8e3f-38a7ecf596a1&offset=0';
  static String ss9 =
      'https://api.cricapi.com/v1/currentMatches?apikey=666ea33c-e017-4b2c-807b-e000436bf17a&offset=0';
  static String ss10 =
      'https://api.cricapi.com/v1/currentMatches?apikey=3966c88a-09ff-41ac-8920-7e61ed0e1109&offset=0';
  static String ss11 =
      'https://api.cricapi.com/v1/currentMatches?apikey=decd3672-d637-491b-8644-369eae91b9eb&offset=0';

  static String s1 =
      'https://api.cricapi.com/v1/series?apikey=95c00616-5fb8-49ba-b4dc-4a9a830a9872&offset=0';
  static String s2 =
      'https://api.cricapi.com/v1/series?apikey=bc403c2e-6cc9-435f-9a88-b527c106b07c&offset=0';
  static String s3 =
      'https://api.cricapi.com/v1/series?apikey=1fb77abf-7bce-4039-a199-6a805660e969&offset=0';
  static String s4 =
      'https://api.cricapi.com/v1/series?apikey=f43ff17a-89d5-4d63-8833-c3d7552f1293&offset=0';
  static String s5 =
      'https://api.cricapi.com/v1/series?apikey=ae34b124-da2b-4799-b32e-3d446b060130&offset=0';
  static String s6 =
      'https://api.cricapi.com/v1/series?apikey=5c1bbce7-f4a2-4e51-be81-5c3e2f0e0177&offset=0';
  static String s7 =
      'https://api.cricapi.com/v1/series?apikey=bf01a906-4de7-4480-aa69-1e4e48b6c568&offset=0';
  static String s8 =
      'https://api.cricapi.com/v1/series?apikey=294e47ae-3b98-4095-8e3f-38a7ecf596a1&offset=0';
  static String s9 =
      'https://api.cricapi.com/v1/series?apikey=666ea33c-e017-4b2c-807b-e000436bf17a&offset=0';
  static String s10 =
      'https://api.cricapi.com/v1/series?apikey=3966c88a-09ff-41ac-8920-7e61ed0e1109&offset=0';
  static String s11 =
      'https://api.cricapi.com/v1/series?apikey=decd3672-d637-491b-8644-369eae91b9eb&offset=0';

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
      var res = await http.get(Uri.parse(ss1));
      var map = json.decode(res.body);
      data = map['data'];
      if (data == null) {
        var res = await http.get(Uri.parse(ss2));
        var map = json.decode(res.body);
        data = map['data'];
        if (data == null) {
          var res = await http.get(Uri.parse(ss3));
          var map = json.decode(res.body);
          data = map['data'];
          if (data == null) {
            var res = await http.get(Uri.parse(ss4));
            var map = json.decode(res.body);
            data = map['data'];
            if (data == null) {
              var res = await http.get(Uri.parse(ss5));
              var map = json.decode(res.body);
              data = map['data'];
              if (data == null) {
                var res = await http.get(Uri.parse(ss6));
                var map = json.decode(res.body);
                data = map['data'];
                if (data == null) {
                  var res = await http.get(Uri.parse(ss7));
                  var map = json.decode(res.body);
                  data = map['data'];
                  if (data == null) {
                    var res = await http.get(Uri.parse(ss8));
                    var map = json.decode(res.body);
                    data = map['data'];
                    if (data == null) {
                      var res = await http.get(Uri.parse(ss9));
                      var map = json.decode(res.body);
                      data = map['data'];
                      if (data == null) {
                        var res = await http.get(Uri.parse(ss10));
                        var map = json.decode(res.body);
                        data = map['data'];
                        if (data == null) {
                          var res = await http.get(Uri.parse(ss11));
                          var map = json.decode(res.body);
                          data = map['data'];
                        } else {
                          data = map['data'];
                        }
                      } else {
                        data = map['data'];
                      }
                    } else {
                      data = map['data'];
                    }
                  } else {
                    data = map['data'];
                  }
                } else {
                  data = map['data'];
                }
              } else {
                data = map['data'];
              }
            } else {
              data = map['data'];
            }
          } else {
            data = map['data'];
          }
        } else {
          data = map['data'];
        }
      } else {
        data = map['data'];
      }
    } else {
      Fluttertoast.showToast(msg: 'You are currently Offline');
      return [];
    }
  }

  static checkstatus(int index) {
    status = false;
    status = data![index]['status'].contains('won');
  }

  static getdata_2() async {
    var res = await http.get(Uri.parse(s1));
    var map = json.decode(res.body);
    data2 = map['data'];
    if (data2 == null) {
      var res = await http.get(Uri.parse(s2));
      var map = json.decode(res.body);
      data2 = map['data'];
      if (data2 == null) {
        var res = await http.get(Uri.parse(s3));
        var map = json.decode(res.body);
        data2 = map['data'];
        if (data2 == null) {
          var res = await http.get(Uri.parse(s4));
          var map = json.decode(res.body);
          data2 = map['data'];
          if (data2 == null) {
            var res = await http.get(Uri.parse(s5));
            var map = json.decode(res.body);
            data2 = map['data'];
            if (data2 == null) {
              var res = await http.get(Uri.parse(s6));
              var map = json.decode(res.body);
              data2 = map['data'];
              if (data2 == null) {
                var res = await http.get(Uri.parse(s7));
                var map = json.decode(res.body);
                data2 = map['data'];
                if (data2 == null) {
                  var res = await http.get(Uri.parse(s8));
                  var map = json.decode(res.body);
                  data2 = map['data'];
                  if (data2 == null) {
                    var res = await http.get(Uri.parse(s9));
                    var map = json.decode(res.body);
                    data2 = map['data'];
                    if (data2 == null) {
                      var res = await http.get(Uri.parse(s9));
                      var map = json.decode(res.body);
                      data2 = map['data'];
                      if (data2 == null) {
                        var res = await http.get(Uri.parse(s9));
                        var map = json.decode(res.body);
                        data2 = map['data'];
                      } else {
                        data2 = map['data'];
                      }
                    } else {
                      data2 = map['data'];
                    }
                  } else {
                    data2 = map['data'];
                  }
                } else {
                  data2 = map['data'];
                }
              } else {
                data2 = map['data'];
              }
            } else {
              data2 = map['data'];
            }
          } else {
            data2 = map['data'];
          }
        } else {
          data2 = map['data'];
        }
      } else {
        data2 = map['data'];
      }
    } else {
      data2 = map['data'];
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
    } else if (mon == '03') {
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
    } else {
      DateTime month = DateTime.now();
      String mon = month.month.toString();
      if (mon == '1') {
        return 'Jan ';
      } else if (mon == '2') {
        return 'Feb ';
      } else if (mon == '3') {
        return 'Mar ';
      } else if (mon == '4') {
        return 'Arp ';
      } else if (mon == '5') {
        return 'May ';
      } else if (mon == '6') {
        return 'jun ';
      } else if (mon == '7') {
        return 'Jul ';
      } else if (mon == '8') {
        return 'Aug ';
      } else if (mon == '9') {
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
}
