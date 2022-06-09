import 'package:http/http.dart' as http;
import 'dart:convert';

class appicall {


  static apicall(
      {required String s, required Map<String, dynamic> request}) async {
    var uri = Uri.parse(s);
    http.Response response = await http.get(uri);
    //print(response.statusCode.toString());
    return await jsonDecode(response.body);
  }


}
