import 'package:cricket/fun/fun.dart';
import 'package:cricket/livematch/livematch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'serieslist.dart';

class live_score extends StatefulWidget {
  const live_score({Key? key}) : super(key: key);

  @override
  State<live_score> createState() => _live_scoreState();
}

class _live_scoreState extends State<live_score> {
  bool animation = true;

  ani() async {
    await Future.delayed(Duration(seconds: 3));
    animation = false;
    setState(() {});
  }

  set() async {
    fun.internet = await fun.checkInternet();
    await fun.getdata();
    setState(() {});
    await fun.getdata_2();
    setState(() {});
  }

  @override
  void initState() {
    ani();
    set();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: animation == true
            ? Scaffold(
                backgroundColor: Color.fromARGB(255, 0, 180, 137),
                body: Hero(
                  tag: Key('123'),
                  child: Center(
                    child: Image.asset('asstes/green_logo.png'),
                  ),
                ),
              )
            : DefaultTabController(
                length: 2,
                child: Scaffold(
                    backgroundColor: Color.fromARGB(255, 0, 180, 137),
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: Color.fromARGB(255, 0, 180, 137),
                      title: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Hero(
                          tag: Key('123'),
                          child: Image.asset(
                            'asstes/green_logo.png',
                            height: 130,
                          ),
                        ),
                      )),
                      bottom: TabBar(
                        indicatorColor: Colors.white,
                        labelColor: Colors.white,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                        unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 14),
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
