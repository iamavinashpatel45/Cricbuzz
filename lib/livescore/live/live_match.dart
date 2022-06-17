import 'package:cricket/fun/fun_live.dart';
import 'package:flutter/material.dart';

class live_match_2 extends StatefulWidget {
  const live_match_2({Key? key}) : super(key: key);

  @override
  State<live_match_2> createState() => _live_match_2State();
}

class _live_match_2State extends State<live_match_2> {
  int index = fun_live.data.score.length - 1;
  int x=(fun_live.data.score.length - 1)%2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      fun_live.shortname == true
                          ? Text(
                        fun_live.data.teamInfo[x].shortname,
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      )
                          : Text(
                        fun_live.data.teamInfo[x].name,
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      fun_live.test == true
                          ? Text(
                              fun_live.data.score[index].inning.contains('1') ==
                                      true
                                  ? '   1st inn'
                                  : '   2nd inn')
                          : Container()
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        fun_live.data.score[index].r.toString() +
                            '-' +
                            fun_live.data.score[index].w.toString(),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '  (' + fun_live.data.score[index].o.toString() + ')',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Text(
                      'CRR',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      fun_live
                          .data
                          .scorecard[fun_live.data.scorecard.length - 1]
                          .totals
                          .rR
                          .toString(),
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Text(
              fun_live.data.status,
              style: TextStyle(
                color: fun_live.status == false ? Colors.red : Colors.blue,
                fontSize: fun_live.data.status.length < 45 ? 16 : 13,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.grey[400],
        ),
        Container(
          height: 25,
          child: Row(
            children: [
              SizedBox(
                width: 180,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text('Batter'),
                ),
              ),
              SizedBox(
                  width: (MediaQuery.of(context).size.width - 180) / 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('R'),
                    ],
                  )),
              SizedBox(
                  width: (MediaQuery.of(context).size.width - 180) / 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('B'),
                    ],
                  )),
              SizedBox(
                  width: (MediaQuery.of(context).size.width - 180) / 7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('4s'),
                    ],
                  )),
              SizedBox(
                  width: (MediaQuery.of(context).size.width - 180) / 7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('6s'),
                    ],
                  )),
              SizedBox(
                  width: (MediaQuery.of(context).size.width - 180) / 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('SR'),
                    ],
                  )),
            ],
          ),
        ),
        Divider(
          color: Colors.grey[400],
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: fun_live.data.scorecard[index].batting.length,
            itemBuilder: (context, index1) {
              return fun_live.data.scorecard[index].batting[index1]
                          .dismissalText ==
                      'batting'
                  ? Container(
                      height: 35,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 180,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                fun_live.data.scorecard[index].batting[index1]
                                    .batsman.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 180) / 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    fun_live
                                        .data.scorecard[index].batting[index1].r
                                        .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 180) / 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(fun_live
                                      .data.scorecard[index].batting[index1].b
                                      .toString()),
                                ],
                              )),
                          SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 180) / 7,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(fun_live
                                      .data.scorecard[index].batting[index1].i4s
                                      .toString()),
                                ],
                              )),
                          SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 180) / 7,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(fun_live
                                      .data.scorecard[index].batting[index1].i6s
                                      .toString()),
                                ],
                              )),
                          SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 180) / 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(fun_live
                                      .data.scorecard[index].batting[index1].sr
                                      .toStringAsFixed(1)),
                                ],
                              )),
                        ],
                      ),
                    )
                  : Container();
            }),
        Container(
          height: 25,
          child: Row(
            children: [
              SizedBox(
                width: 180,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text('Bowler'),
                ),
              ),
              SizedBox(
                  width: (MediaQuery.of(context).size.width - 180) / 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('O'),
                    ],
                  )),
              SizedBox(
                  width: (MediaQuery.of(context).size.width - 180) / 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('M'),
                    ],
                  )),
              SizedBox(
                  width: (MediaQuery.of(context).size.width - 180) / 7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('R'),
                    ],
                  )),
              SizedBox(
                  width: (MediaQuery.of(context).size.width - 180) / 7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('w'),
                    ],
                  )),
              SizedBox(
                  width: (MediaQuery.of(context).size.width - 180) / 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('ER'),
                    ],
                  )),
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index2) {
              int? x = fun_live.checkblower();
              return x != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 35,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 180,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  fun_live.data.scorecard[index].bowling[x]
                                      .bowler.name,
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 180) /
                                        5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(fun_live
                                        .data.scorecard[index].bowling[x].o
                                        .toString()),
                                  ],
                                )),
                            SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 180) /
                                        5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(fun_live
                                        .data.scorecard[index].bowling[x].m
                                        .toString()),
                                  ],
                                )),
                            SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 180) /
                                        7,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(fun_live
                                        .data.scorecard[index].bowling[x].r
                                        .toString()),
                                  ],
                                )),
                            SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 180) /
                                        7,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      fun_live
                                          .data.scorecard[index].bowling[x].w
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 180) /
                                        5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(fun_live
                                        .data.scorecard[index].bowling[x].eco
                                        .toStringAsFixed(1)),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    )
                  : Container();
            }),
      ],
    );
  }
}
