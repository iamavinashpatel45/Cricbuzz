import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../serieslist.dart';

class live_score extends StatefulWidget {
  const live_score({Key? key}) : super(key: key);

  @override
  State<live_score> createState() => _live_scoreState();
}

class _live_scoreState extends State<live_score> {
  List? data;
  bool test = false;
  bool a = false, b = false, c = false, d = false;
  bool noscore = false;
  bool shortname = true;

  GlobalKey<RefreshIndicatorState> global_key = new GlobalKey<RefreshIndicatorState>();

  getdata() async {
    var res = await http.get(Uri.parse(
        'https://api.cricapi.com/v1/currentMatches?apikey=95c00616-5fb8-49ba-b4dc-4a9a830a9872&offset=0'));
    var map = json.decode(res.body);
    data = map['data'];
    //data?.removeAt(0);
    //data?.removeAt(6);
    setState(() {});
  }

  checktest(int index) {
    a = false;
    b = false;
    c = false;
    d = false;
    int z = data![index]['score']?.length;
    print(z.toString());
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

  Future refresh() async {
    setState(() {
      getdata();
    });
  }

  short(int index) {
    shortname = true;
    if (data![index]['teamInfo'][0]['shortname'] == null &&
        data![index]['teamInfo'][1]['shortname'] == null) {
      shortname = false;
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'asstes/logo.png',
            height: 130,
          ),
        ),
      ),
      bottomNavigationBar: data?.length == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: 60,
              color: Colors.blue[500],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                        child: Text(
                      'Upcoming Series List',
                      style: TextStyle(fontSize: 20),
                    )),
                    InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => myapp())),
                      child: Icon(
                        Icons.navigate_next,
                        size: 35,
                      ),
                    )
                  ],
                ),
              ),
            ),
      body: data?.length == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              key: global_key,
              onRefresh: () => refresh(),
              child: ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    var d = data![index];
                    checktest(index);
                    short(index);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Card(
                        borderOnForeground: false,
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  d['name'],
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Vanue: ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      d['venue'],
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Time: ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          d['dateTimeGMT'],
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Date: ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Date: ' + d['date'],
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(70),
                                            child: Image.network(
                                              d['teamInfo'][0]['img'],
                                              height: 30,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          shortname == true
                                              ? Text(
                                                  d['teamInfo'][0]['shortname'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                )
                                              : Text(d['teamInfo'][0]['name'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                        ],
                                      ),
                                      a == true
                                          ? c == true
                                              ? Column(
                                                  children: [
                                                    Text(
                                                      d['score'][0]['r']
                                                              .toString() +
                                                          '/' +
                                                          d['score'][0]['w']
                                                              .toString() +
                                                          '(' +
                                                          d['score'][0]['o']
                                                              .toString() +
                                                          ' ov)',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      d['score'][2]['r']
                                                              .toString() +
                                                          '/' +
                                                          d['score'][2]['w']
                                                              .toString() +
                                                          '(' +
                                                          d['score'][2]['o']
                                                              .toString() +
                                                          ' ov)',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                )
                                              : Text(
                                                  d['score'][0]['r']
                                                          .toString() +
                                                      '/' +
                                                      d['score'][0]['w']
                                                          .toString() +
                                                      '(' +
                                                      d['score'][0]['o']
                                                          .toString() +
                                                      ' ov)',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                )
                                          : Container(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.network(
                                            d['teamInfo'][1]['img'],
                                            height: 30,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          shortname == true
                                              ? Text(
                                                  d['teamInfo'][1]['shortname'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                )
                                              : Text(d['teamInfo'][1]['name'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                        ],
                                      ),
                                      b == true
                                          ? d == true
                                              ? Column(
                                                  children: [
                                                    Text(
                                                      d['score'][0]['r']
                                                              .toString() +
                                                          '/' +
                                                          d['score'][0]['w']
                                                              .toString() +
                                                          '(' +
                                                          d['score'][0]['o']
                                                              .toString() +
                                                          ' ov)',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      d['score'][2]['r']
                                                              .toString() +
                                                          '/' +
                                                          d['score'][2]['w']
                                                              .toString() +
                                                          '(' +
                                                          d['score'][2]['o']
                                                              .toString() +
                                                          ' ov)',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                )
                                              : Text(
                                                  d['score'][1]['r']
                                                          .toString() +
                                                      '/' +
                                                      d['score'][1]['w']
                                                          .toString() +
                                                      '(' +
                                                      d['score'][1]['o']
                                                          .toString() +
                                                      ' ov)',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                )
                                          : Container(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    d['status'],
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}

// Text(
// d['score'][0]['r'].toString() +
// '/' +
// d['score'][0]['w'].toString() +
// '(' +
// d['score'][0]['o'].toString() +
// ' ov)',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// color: Colors.black),
// ),
