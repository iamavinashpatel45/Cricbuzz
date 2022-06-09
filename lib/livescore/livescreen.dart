import 'package:cricket/fun/fun_live.dart';
import 'package:flutter/material.dart';

class live_screen extends StatefulWidget {
  final String? link;

  const live_screen({Key? key, required this.link}) : super(key: key);

  @override
  State<live_screen> createState() => _live_screenState();
}

class _live_screenState extends State<live_screen> {
  String? link;
  List? data;
  var d;

  getlink(String? l) {
    link = l;
  }

  set() async {
    data = await fun_live.getdata(link!);
    print(data);
    d = data!;
    setState(() {});
  }

  @override
  void initState() {
    getlink(widget.link);
    set();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: fun_live.shortname == true
      //       ? Text(
      //           d['teamInfo'][0]['shortname']+' vs '+d['teamInfo'][0]['shortname'],
      //           style:
      //               TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      //         )
      //       : Text(d['teamInfo'][0]['name']+' vs '+d['teamInfo'][0]['name'],
      //           style: TextStyle(
      //               fontWeight: FontWeight.bold, color: Colors.black)),
      // ),
      // body: fun_live.internet == true
      //     ? Column(
      //         children: [
      //           Container(
      //             child: Text('avinsh'),
      //           )
      //         ],
      //       )
      //     : Container(),
    );
  }
}
