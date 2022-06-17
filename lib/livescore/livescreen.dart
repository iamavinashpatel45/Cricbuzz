import 'dart:ui';
import 'package:cricket/fun/fun_info.dart';
import 'package:cricket/fun/fun_live.dart';
import 'package:cricket/livescore/info/info.dart';
import 'package:cricket/livescore/live/live_details.dart';
import 'package:cricket/livescore/scorecard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:share/share.dart';

class live_screen extends StatefulWidget {
  final String? link;
  const live_screen({Key? key, required this.link}) : super(key: key);

  @override
  State<live_screen> createState() => _live_screenState();
}

class _live_screenState extends State<live_screen> {
  String? link;

  share_optap() async {
    String x = ' ';
    await Share.share(fun_live.data.name);
    for (int i = 0; i < fun_live.data.score.length; i++) {
      await Share.share(fun_live.test == false
          ? x = x +
              fun_live.name(i)! +
              ' ' +
              fun_live.data.score[i].r.toString() +
              '-' +
              fun_live.data.score[i].w.toString() +
              ' (' +
              fun_live.data.score[i].o.toString() +
              ')'
          : x = x +
              fun_live.data.score[i].inning! +
              ' ' +
              fun_live.data.score[i].r.toString() +
              '-' +
              fun_live.data.score[i].w.toString() +
              ' (' +
              fun_live.data.score[i].o.toString() +
              ')');
    }
  }

  getlink(String? l) {
    link = l;
  }

  set() async {
    await fun_live.getdata(link!);
    await fun_info.getdata(link!);
    fun_live.progressbar = false;
    fun_live.short();
    setState(() {});
  }

  @override
  void initState() {
    fun_live.progressbar = true;
    getlink(widget.link);
    set();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: fun_live.progressbar == false
              ? AppBar(
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  backgroundColor: Color.fromARGB(255, 0, 180, 137),
                  elevation: 1,
                  bottom: TabBar(
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    unselectedLabelStyle:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                    tabs: [
                      Tab(
                        text: 'INFO',
                      ),
                      Tab(
                        text: 'LIVE',
                      ),
                      Tab(
                        text: 'SCORECARD',
                      ),
                    ],
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 250,
                        child: fun_live.shortname == true
                            ? Text(
                          fun_live.data.teamInfo[0].shortname +
                              ' vs ' +
                              fun_live.data.teamInfo[1].shortname,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                            : Text(
                            fun_live.data.teamInfo[0].name +
                                ' vs ' +
                                fun_live.data.teamInfo[1].name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: InkWell(
                          onTap: () {
                            share_optap();
                          },
                          child: Icon(Icons.share),
                        ),
                      )
                    ],
                  ),
                )
              : AppBar(
                  backgroundColor: Color.fromARGB(255, 0, 180, 137),
                ),
          body: fun_live.progressbar == false
              ? TabBarView(
                  children: [
                    info(
                      link: fun_live.data.id,
                    ),
                    live_details(
                      link: link,
                    ),
                    scorecard(
                      link: link,
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 0, 180, 137),
                  ),
                ),
        ));
  }
}
