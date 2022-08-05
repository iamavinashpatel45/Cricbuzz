import 'package:auto_size_text/auto_size_text.dart';
import 'package:cricket/fun/fun_live.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class scorecard extends StatefulWidget {
  final String? link;

  const scorecard({Key? key, required this.link}) : super(key: key);

  @override
  State<scorecard> createState() => _scorecardState();
}

class _scorecardState extends State<scorecard> {
  bool tap = false;
  bool tap1 = false;
  bool tap2 = false;
  bool tap3 = false;
  bool tap4 = false;
  String tapstring = '';
  String? link;

  GlobalKey<RefreshIndicatorState> global_key =
      new GlobalKey<RefreshIndicatorState>();

  getlink(String? l) {
    link = l;
  }

  set() async {
    await fun_live.getdata(link!);
    setState(() {});
  }


  @override
  void initState() {
    getlink(widget.link);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: global_key,
      onRefresh: () => set(),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        fun_live.data.status,
                        maxLines: 1,
                        style: TextStyle(
                          color: fun_live.status == false
                              ? Colors.red
                              : Colors.blue,
                          fontSize: 15,
                              //fun_live.data.status.length < 45 ? 15 : 13,
                        ),
                      ),
                    ),
                  ],
                )),
            if (fun_live.data.score.length == 0)
              Container()
            else
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: fun_live.data.score.length,
                    itemBuilder: (context, index) {
                      var d = fun_live.data.scorecard[index];
                      return StickyHeader(
                        header: InkWell(
                          onTap: () {
                            setState(() {
                              tap = !tap;
                              tapstring = index.toString();
                              if (tap == false) {
                                tapstring = '';
                              }
                            });
                          },
                          child: Card(
                            color: tap == true && tapstring == index.toString()
                                ? Color.fromARGB(255, 0, 180, 137)
                                : Colors.white,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  fun_live.test == false
                                      ? Text(
                                          fun_live.name(index)!,
                                          style: TextStyle(
                                            color: tap == true &&
                                                    tapstring ==
                                                        index.toString()
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        )
                                      : Expanded(
                                          child: Text(
                                            fun_live.data.score[index].inning,
                                            style: TextStyle(
                                              color: tap == true &&
                                                      tapstring ==
                                                          index.toString()
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                  Row(
                                    children: [
                                      Text(
                                        fun_live.data.score[index].r
                                                .toString() +
                                            '-' +
                                            fun_live.data.score[index].w
                                                .toString() +
                                            ' (' +
                                            fun_live.data.score[index].o
                                                .toString() +
                                            ')',
                                        style: TextStyle(
                                          color: tap == true &&
                                                  tapstring == index.toString()
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      tap == true &&
                                              tapstring == index.toString()
                                          ? Icon(
                                              Icons.keyboard_arrow_up,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.black,
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        content: Column(
                          children: [
                            if (tap == true && tapstring == index.toString())
                              Column(
                                children: [
                                  Container(
                                    height: 40,
                                    color: Color.fromARGB(255, 218, 240, 235),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              'Batter',
                                              style: TextStyle(
                                                  color: Colors.grey[800]),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    180) /
                                                5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'R',
                                                  style: TextStyle(
                                                      color: Colors.grey[800]),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    180) /
                                                5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'B',
                                                  style: TextStyle(
                                                      color: Colors.grey[800]),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    180) /
                                                7,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '4s',
                                                  style: TextStyle(
                                                      color: Colors.grey[800]),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    180) /
                                                7,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '6s',
                                                  style: TextStyle(
                                                      color: Colors.grey[800]),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    180) /
                                                5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'SR',
                                                  style: TextStyle(
                                                      color: Colors.grey[800]),
                                                ),
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
                                      physics: ClampingScrollPhysics(),
                                      itemCount: fun_live
                                          .data.scorecard[index].batting.length,
                                      itemBuilder: (context, index2) {
                                        return Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 180,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                        d.batting[index2]
                                                            .batsman.name,
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              180) /
                                                          5,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            d.batting[index2].r
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                  SizedBox(
                                                      width: (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              180) /
                                                          5,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            d.batting[index2].b
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[800]),
                                                          ),
                                                        ],
                                                      )),
                                                  SizedBox(
                                                      width: (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              180) /
                                                          7,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            d.batting[index2]
                                                                .i4s
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[800]),
                                                          ),
                                                        ],
                                                      )),
                                                  SizedBox(
                                                      width: (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              180) /
                                                          7,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            d.batting[index2]
                                                                .i6s
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[800]),
                                                          ),
                                                        ],
                                                      )),
                                                  SizedBox(
                                                      width: (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              180) /
                                                          5,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            d.batting[index2].sr
                                                                .toStringAsFixed(
                                                                    1),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[800]),
                                                          ),
                                                        ],
                                                      )),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, left: 10),
                                                child: Text(
                                                  d.batting[index2]
                                                      .dismissalText,
                                                  style: TextStyle(
                                                      color: Colors.grey[800]),
                                                ),
                                              ),
                                              Divider(
                                                color: Colors.grey[400],
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                  Container(
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Extras',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                d.extras.r.toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(', b ' +
                                                  d.extras.b.toString()),
                                              Text(', lb ' +
                                                  d.extras.lb.toString()),
                                              Text(', w ' +
                                                  d.extras.w.toString()),
                                              Text(', nb ' +
                                                  d.extras.nb.toString()),
                                              Text(', p ' +
                                                  d.extras.p.toString()),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey[400],
                                  ),
                                  Container(
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                d.totals.r.toString() +
                                                    '-' +
                                                    d.totals.w.toString() +
                                                    ' (' +
                                                    d.totals.o.toString() +
                                                    ')    CRR' +
                                                    d.totals.rR.toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    color: Color.fromARGB(255, 218, 240, 235),
                                    // height:,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              'Bowler',
                                              style: TextStyle(
                                                  color: Colors.grey[800]),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    180) /
                                                5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'O',
                                                  style: TextStyle(
                                                      color: Colors.grey[800]),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    180) /
                                                5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'M',
                                                  style: TextStyle(
                                                      color: Colors.grey[800]),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    180) /
                                                7,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'R',
                                                  style: TextStyle(
                                                      color: Colors.grey[800]),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    180) /
                                                7,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'w',
                                                  style: TextStyle(
                                                      color: Colors.grey[800]),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    180) /
                                                5,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'ER',
                                                  style: TextStyle(
                                                      color: Colors.grey[800]),
                                                ),
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
                                      physics: ClampingScrollPhysics(),
                                      itemCount: fun_live
                                          .data.scorecard[index].bowling.length,
                                      itemBuilder: (context, index3) {
                                        return Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 30,
                                                  width: 180,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text(
                                                      d.bowling[index3].bowler
                                                          .name,
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width -
                                                                180) /
                                                            5,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          d.bowling[index3].o
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[800]),
                                                        ),
                                                      ],
                                                    )),
                                                SizedBox(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width -
                                                                180) /
                                                            5,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          d.bowling[index3].m
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[800]),
                                                        ),
                                                      ],
                                                    )),
                                                SizedBox(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width -
                                                                180) /
                                                            7,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          d.bowling[index3].r
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[800]),
                                                        ),
                                                      ],
                                                    )),
                                                SizedBox(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width -
                                                                180) /
                                                            7,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          d.bowling[index3].w
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                                SizedBox(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width -
                                                                180) /
                                                            5,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          d.bowling[index3].eco
                                                              .toStringAsFixed(
                                                                  1),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[800]),
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                            Divider(
                                              color: Colors.grey[400],
                                            ),
                                          ],
                                        );
                                      })
                                ],
                              )
                            else
                              Container()
                          ],
                        ),
                      );
                    }),
              )
          ],
        ),
      ),
    );
  }
}
