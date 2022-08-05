import 'package:cricket/fun/fun_com.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class com extends StatefulWidget {
  final String? link;

  const com({Key? key, required this.link}) : super(key: key);

  @override
  State<com> createState() => _comState();
}

class _comState extends State<com> {
  String? link;
  List<String> arr=[];

  //var arr = new List.filled(5, null, growable: false);

  getlink(String? l) {
    link = l;
  }

  set() async {
    await fun_com.getdata(link!);
  }

  @override
  void initState() {
    getlink(widget.link);
    set();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: fun_com.data.bbb.length > 50 ? 50 : fun_com.data.bbb.length,
        itemBuilder: (context, index) {
          int reverseindex = fun_com.data.bbb.length - index - 1;
          var d = fun_com.data.bbb[reverseindex];
          return Column(
            children: [
              d.ball == 6
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text("OVER " + (d.over + 1).toString()),
                          ),
                          // ListView.builder(
                          //     shrinkWrap: true,
                          //     itemCount: arr?.length,
                          //     itemBuilder: (context, index2) {
                          //       return Text(arr![index2].toString());
                          //     }),
                          // Divider(
                          //   color: Colors.black,
                          // ),
                          // Column(
                          //   children: [
                          //     Text("")
                          //   ],
                          // )
                        ],
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: SizedBox(
                            width: 45,
                            child: Text(
                                d.over.toString() + "." + d.ball.toString()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: d.runs == 6
                                    ? Colors.purpleAccent
                                    : d.runs == 4
                                        ? Colors.lightGreen
                                        : d.runs == 2
                                            ? Colors.blue
                                            : Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            child: Center(
                                child: Text(
                              d.runs.toString(),
                              style: TextStyle(
                                  color:
                                      d.runs == 6 || d.runs == 4 || d.runs == 2
                                          ? Colors.white
                                          : Colors.black),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Expanded(
                        child: Text(d.bowler.name + " to " + d.batsman.name))
                  ],
                ),
              ),
            ],
          );
        });
  }
}
