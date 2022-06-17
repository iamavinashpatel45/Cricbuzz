import 'dart:async';
import 'package:cricket/fun/fun.dart';
import 'package:cricket/fun/fun_info.dart';
import 'package:cricket/fun/fun_live.dart';
import 'package:flutter/material.dart';
import '../livescore/livescreen.dart';

class live_match extends StatefulWidget {
  const live_match({Key? key}) : super(key: key);

  @override
  State<live_match> createState() => _live_matchState();
}

class _live_matchState extends State<live_match> {
  Timer? timer;

  GlobalKey<RefreshIndicatorState> global_key =
      new GlobalKey<RefreshIndicatorState>();

  set() async {
    fun.internet = await fun.checkInternet();
    if (fun.internet == true) {
      await fun.getdata();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(minutes: 2), (timer) {
      set();
    });
  }

  @override
  Widget build(BuildContext context) {
    return fun.internet == true
        ? fun.data?.length == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : RefreshIndicator(
                key: global_key,
                onRefresh: () => set(),
                child: ListView.builder(
                    itemCount: fun.data?.length,
                    itemBuilder: (context, index) {
                      var d = fun.data![index];
                      fun.checktest(index);
                      fun.short(index);
                      fun.check_score(index);
                      fun.checkstatus(index);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: InkWell(
                          onTap: () => Navigator.of(context)
                              .push(
                                MaterialPageRoute(
                                    builder: (context) => live_screen(
                                          link: d['id'],
                                        )),
                              )
                              .then((value) => {
                                    fun_info.data = null,
                                    fun_live.data = null,
                                  }),
                          child: Card(
                            borderOnForeground: false,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Venue: ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Expanded(
                                          child: Text(
                                            d['venue'],
                                            style: TextStyle(fontSize: 12),
                                          ),
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
                                              d['dateTimeGMT'].substring(
                                                  11, d['dateTimeGMT'].length),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10),
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
                                                          BorderRadius.circular(
                                                              70),
                                                      child: Image.network(
                                                        d['teamInfo'][0]['img'],
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
                                                        : SizedBox(
                                                            width: 160,
                                                            child: Text(
                                                                d['teamInfo'][0]
                                                                    ['name'],
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black)),
                                                          ),
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
                                                                        color: Colors
                                                                            .black),
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
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              )
                                                            : Text(
                                                                d['score'][0][
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
                                                                        color: Colors
                                                                            .black),
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
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              )
                                                            : Text(
                                                                d['score'][1][
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
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              70),
                                                      child: Image.network(
                                                        d['teamInfo'][1]['img'],
                                                        height: 30,
                                                      ),
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
                                                        : SizedBox(
                                                            width: 160,
                                                            child: Text(
                                                                d['teamInfo'][1]
                                                                    ['name'],
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black)),
                                                          ),
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
                                                                        color: Colors
                                                                            .black),
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
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              )
                                                            : Text(
                                                                d['score'][1][
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
                                                                        color: Colors
                                                                            .black),
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
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              )
                                                            : Text(
                                                                d['score'][0][
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
                                        color: fun.status == false
                                            ? Colors.red
                                            : Colors.blue,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Whoops!',
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  'No Internet Connection Found',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  'Check Your Internet',
                  style: TextStyle(fontSize: 25),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (fun.checkInternet() == true) {
                        if (fun.data?.length == null) {
                          set();
                        }
                        setState(() {});
                      } else {
                        setState(() {});
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(
                      'Try Again',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          );
  }
}
