import 'package:connectivity/connectivity.dart';
import 'package:cricket/News/json_news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class fun_news {
  static bool internet = false;
  static var map;
  static var data;
  static String link =
      "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=524a3e179d1c46ed8df4d0a1f002f598";

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

  static Future<Object?> getdata() async {
    internet = await checkInternet();
    if (internet == true) {
      var res = await http.get(Uri.parse(link));
      map = json.decode(res.body);
      data=json_news.fromJson(map).articles;
    }
  }
}
