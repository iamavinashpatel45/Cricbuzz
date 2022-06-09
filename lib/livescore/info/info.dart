import 'package:cricket/fun/fun_live.dart';
import 'package:cricket/livescore/info/squads/squads.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class info extends StatefulWidget {
  final String? link;

  const info({Key? key, required this.link}) : super(key: key);

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  String? link;

  getlink(String? l) {
    link = l;
  }

  @override
  void initState() {
    getlink(widget.link);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 236, 240, 241),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10),
              child: Text('SQUADS'),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => squads(
                          index: 0,
                        ))),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(fun_live.data.teams[0]),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey[400],
          ),
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => squads(
                          index: 1,
                        ))),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(fun_live.data.teams[1]),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 236, 240, 241),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 12),
              child: Text('INFO'),
            ),
          ),
          Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text('Match'),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/1.3,
                          child: Text(fun_live.data.name),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text('MatchType'),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/1.3,
                          child: Text(fun_live.data.matchType),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text('Date'),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/1.3,
                          child: fun_live.test == true
                              ? Text(
                            fun_live.date()! +
                                fun_live.day.toString() +
                                ' - ' +
                                fun_live.date()! +
                                (fun_live.day! + 4)
                                    .toString(),
                            style: TextStyle(
                                fontSize: 12),
                          )
                              : Text(
                            fun_live.date()! +
                                ' ' +
                                fun_live.day.toString(),
                            style: TextStyle(
                                fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text('Time'),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/1.3,
                          child: Text(fun_live.data.dateTimeGMT.substring(
                              11, fun_live.data.dateTimeGMT.length),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text('Venue'),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/1.3,
                          child: Text(fun_live.data.venue),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
