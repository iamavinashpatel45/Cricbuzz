import 'dart:async';
import 'package:cricket/fun/fun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../livescore/livescreen.dart';
import '../serieslist.dart';

class live_score extends StatefulWidget {
  const live_score({Key? key}) : super(key: key);

  @override
  State<live_score> createState() => _live_scoreState();
}

class _live_scoreState extends State<live_score> {
  List? data;
  Timer? timer;

  GlobalKey<RefreshIndicatorState> global_key =
      new GlobalKey<RefreshIndicatorState>();

  set() async {
    data = await fun.getdata();
    setState(() {
    });
  }


  @override
  void initState() {
    set();
    timer=Timer.periodic(Duration(minutes: 1), (timer) {fun.refresh();});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[400],
          title: Center(
              child: Image.asset(
            'asstes/logo.png',
            height: 130,
          )),
        ),
        bottomNavigationBar: fun.data?.length == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.grey[400],
                ),
              )
            : Container(
                height: 60,
                color: Colors.grey[400],
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
        body: fun.internet == true
            ? data?.length == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    key: global_key,
                    onRefresh: () => fun.refresh(),
                    child: ListView.builder(
                        itemCount: fun.data?.length,
                        itemBuilder: (context, index) {
                          var d = data![index];
                          fun.checktest(index);
                          fun.short(index);
                          fun.check_score(index);
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: InkWell(
                              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>live_screen(link: d['id'],))),
                              child: Card(
                                borderOnForeground: false,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: ListTile(
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              'Venue: ',
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
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  d['dateTimeGMT'].substring(11,
                                                      d['dateTimeGMT'].length),
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0, bottom: 5),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Date: ',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  fun.test == true
                                                      ? Text(
                                                          fun.date(index)! +
                                                              fun.day.toString() +
                                                              ' - ' +
                                                              fun.date(index)! +
                                                              (fun.day! + 4)
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        )
                                                      : Text(
                                                          fun.date(index)! +
                                                              ' ' +
                                                              fun.day.toString(),
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(70),
                                                          child: Image.network(
                                                            d['teamInfo'][0]
                                                                ['img'],
                                                            height: 30,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        fun.shortname == true
                                                            ? Text(
                                                                d['teamInfo'][0]
                                                                    ['shortname'],
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              )
                                                            : Text(
                                                                d['teamInfo'][0]
                                                                    ['name'],
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black)),
                                                      ],
                                                    ),
                                                    fun.check == true
                                                        ? fun.a == true
                                                            ? fun.c == true
                                                                ? Column(
                                                                    children: [
                                                                      Text(
                                                                        d['score'][0]['r'].toString() +
                                                                            '/' +
                                                                            d['score'][0]['w']
                                                                                .toString() +
                                                                            '(' +
                                                                            d['score'][0]['o']
                                                                                .toString() +
                                                                            ' ov)',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      SizedBox(
                                                                        height: 5,
                                                                      ),
                                                                      Text(
                                                                        d['score'][2]['r'].toString() +
                                                                            '/' +
                                                                            d['score'][2]['w']
                                                                                .toString() +
                                                                            '(' +
                                                                            d['score'][2]['o']
                                                                                .toString() +
                                                                            ' ov)',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ],
                                                                  )
                                                                : Text(
                                                                    d['score'][0]
                                                                                [
                                                                                'r']
                                                                            .toString() +
                                                                        '/' +
                                                                        d['score'][0]
                                                                                [
                                                                                'w']
                                                                            .toString() +
                                                                        '(' +
                                                                        d['score'][0]
                                                                                [
                                                                                'o']
                                                                            .toString() +
                                                                        ' ov)',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  )
                                                            : Container()
                                                        : fun.b == true
                                                            ? fun.d == true
                                                                ? Column(
                                                                    children: [
                                                                      Text(
                                                                        d['score'][1]['r'].toString() +
                                                                            '/' +
                                                                            d['score'][1]['w']
                                                                                .toString() +
                                                                            '(' +
                                                                            d['score'][1]['o']
                                                                                .toString() +
                                                                            ' ov)',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      SizedBox(
                                                                        height: 5,
                                                                      ),
                                                                      Text(
                                                                        d['score'][3]['r'].toString() +
                                                                            '/' +
                                                                            d['score'][3]['w']
                                                                                .toString() +
                                                                            '(' +
                                                                            d['score'][3]['o']
                                                                                .toString() +
                                                                            ' ov)',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ],
                                                                  )
                                                                : Text(
                                                                    d['score'][1]
                                                                                [
                                                                                'r']
                                                                            .toString() +
                                                                        '/' +
                                                                        d['score'][1]
                                                                                [
                                                                                'w']
                                                                            .toString() +
                                                                        '(' +
                                                                        d['score'][1]
                                                                                [
                                                                                'o']
                                                                            .toString() +
                                                                        ' ov)',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  )
                                                            : Container(),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.network(
                                                          d['teamInfo'][1]['img'],
                                                          height: 30,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        fun.shortname == true
                                                            ? Text(
                                                                d['teamInfo'][1]
                                                                    ['shortname'],
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              )
                                                            : Text(
                                                                d['teamInfo'][1]
                                                                    ['name'],
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black)),
                                                      ],
                                                    ),
                                                    fun.check == true
                                                        ? fun.b == true
                                                            ? d == true
                                                                ? Column(
                                                                    children: [
                                                                      Text(
                                                                        d['score'][1]['r'].toString() +
                                                                            '/' +
                                                                            d['score'][1]['w']
                                                                                .toString() +
                                                                            '(' +
                                                                            d['score'][1]['o']
                                                                                .toString() +
                                                                            ' ov)',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      SizedBox(
                                                                        height: 5,
                                                                      ),
                                                                      Text(
                                                                        d['score'][3]['r'].toString() +
                                                                            '/' +
                                                                            d['score'][3]['w']
                                                                                .toString() +
                                                                            '(' +
                                                                            d['score'][3]['o']
                                                                                .toString() +
                                                                            ' ov)',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ],
                                                                  )
                                                                : Text(
                                                                    d['score'][1]
                                                                                [
                                                                                'r']
                                                                            .toString() +
                                                                        '/' +
                                                                        d['score'][1]
                                                                                [
                                                                                'w']
                                                                            .toString() +
                                                                        '(' +
                                                                        d['score'][1]
                                                                                [
                                                                                'o']
                                                                            .toString() +
                                                                        ' ov)',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  )
                                                            : Container()
                                                        : fun.a == true
                                                            ? fun.c == true
                                                                ? Column(
                                                                    children: [
                                                                      Text(
                                                                        d['score'][0]['r'].toString() +
                                                                            '/' +
                                                                            d['score'][0]['w']
                                                                                .toString() +
                                                                            '(' +
                                                                            d['score'][0]['o']
                                                                                .toString() +
                                                                            ' ov)',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      SizedBox(
                                                                        height: 5,
                                                                      ),
                                                                      Text(
                                                                        d['score'][2]['r'].toString() +
                                                                            '/' +
                                                                            d['score'][2]['w']
                                                                                .toString() +
                                                                            '(' +
                                                                            d['score'][2]['o']
                                                                                .toString() +
                                                                            ' ov)',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ],
                                                                  )
                                                                : Text(
                                                                    d['score'][0]
                                                                                [
                                                                                'r']
                                                                            .toString() +
                                                                        '/' +
                                                                        d['score'][0]
                                                                                [
                                                                                'w']
                                                                            .toString() +
                                                                        '(' +
                                                                        d['score'][0]
                                                                                [
                                                                                'o']
                                                                            .toString() +
                                                                        ' ov)',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  )
                                                            : Container()
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
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
                  )
            : Container(
                child: Center(
                    //child: Image.asset('asstes/nointernet.png'),
                    ),
              ));
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
