import 'package:cricket/fun/fun.dart';
import 'package:cricket/livematch/drawer.dart';
import 'package:cricket/livematch/livematch.dart';
import 'package:cricket/login/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../login/login_page/login_page.dart';
import 'serieslist.dart';

class live_score extends StatefulWidget {
  const live_score({Key? key}) : super(key: key);

  @override
  State<live_score> createState() => _live_scoreState();
}

class _live_scoreState extends State<live_score> {
  set() async {
    await fun.getdata();
    setState(() {});
    await fun.getdata_2();
    setState(() {});
  }

  @override
  void initState() {
    set();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 0, 180, 137),
          //drawer: account.login == true ? mydrawer() : Container(),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 0, 180, 137),
            title: Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: Key('123'),
                    child: Image.asset(
                      'asstes/green_logo.png',
                      height: 90,
                    ),
                  ),
                  account.login == false
                      ? Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 2,
                                ),
                                BoxShadow(
                                  color: Color.fromARGB(255, 0, 180, 137),
                                ),
                              ]),
                          child: InkWell(
                            onTap: () => Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                      builder: (context) => login_page()),
                                )
                                .then((value) => {setState(() {})}),
                            child: Center(
                              child: Text(
                                'Log in',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        )
                      : Container(
                    height:40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 2,
                                ),
                                BoxShadow(
                                  color: Color.fromARGB(255, 0, 180, 137),
                                ),
                              ]),
                          child: IconButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => mydrawer())),
                            icon: Center(
                              child: Icon(Icons.person_rounded),
                            ),
                            tooltip: MaterialLocalizations.of(context)
                                .openAppDrawerTooltip,
                          ),
                        ),
                ],
              ),
            )),
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              tabs: [
                Tab(
                  text: 'Live-Match',
                ),
                Tab(
                  text: 'Upcoming-Series',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              live_match(),
              myapp(),
            ],
          )),
    ));
  }
}
