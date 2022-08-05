import 'package:cricket/News/news.dart';
import 'package:cricket/fun/fun.dart';
import 'package:cricket/livematch/livematch.dart';
import 'package:cricket/login/account.dart';
import 'package:cricket/login/login_page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../login/login_page/profile.dart';
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
         // backgroundColor: Color.fromARGB(255, 0, 180, 137),
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Color.fromARGB(255, 0, 180, 137),
            title: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Image.asset(
                'asstes/green_logo.png',
                height: 100,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20, top: 5),
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 2),
                    height: 40,
                    width: 40,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 2,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(255, 0, 180, 137),
                      ),
                    ]),
                    child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            PageTransition(
                                child: news(),
                                duration: Duration(milliseconds: 400),
                                type: PageTransitionType.bottomToTop)),
                        child: Icon(Icons.newspaper))),
              ),
              Padding(
                padding: EdgeInsets.only(right: 25, top: 5),
                child: fun.internet == false || account.login == false
                    ? Center(
                        child: Container(
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
                                .push(PageTransition(
                                    child: LoginPage(),
                                    duration: Duration(milliseconds: 400),
                                    type: PageTransitionType.bottomToTop))
                                .then((value) => {setState(() {})}),
                            child: Center(
                              child: Text(
                                'Log in',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 2,
                            ),
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 180, 137),
                            ),
                          ]),
                          child: IconButton(
                            onPressed: () => Navigator.of(context)
                                .push(PageTransition(
                                    child: profile(),
                                    duration: Duration(milliseconds: 400),
                                    type: PageTransitionType.bottomToTop))
                                .then((value) => {setState(() {})}),
                            icon: Center(
                              child: Icon(Icons.person_rounded),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
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
