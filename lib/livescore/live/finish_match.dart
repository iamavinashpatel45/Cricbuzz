import 'package:cricket/fun/fun_live.dart';
import 'package:cricket/livescore/live/com.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class finish_match extends StatefulWidget {
  const finish_match({Key? key}) : super(key: key);

  @override
  State<finish_match> createState() => _finish_matchState();
}

class _finish_matchState extends State<finish_match> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                fun_live.shortname == true
                    ? Text(
                        fun_live.data.teamInfo[0].shortname,
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        fun_live.data.teamInfo[0].name,
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                Text(
                  '  ' +
                      fun_live.data.score[0].r.toString() +
                      '-' +
                      fun_live.data.score[0].w.toString() +
                      '  (' +
                      fun_live.data.score[0].o.toString() +
                      ')',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                fun_live.shortname == true
                    ? Text(
                        fun_live.data.teamInfo[1].shortname,
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        fun_live.data.teamInfo[0].name,
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                Text(
                  '  ' +
                      fun_live.data.score[1].r.toString() +
                      '-' +
                      fun_live.data.score[1].w.toString() +
                      '  (' +
                      fun_live.data.score[1].o.toString() +
                      ')',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[400],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              fun_live.data.status,
              style: TextStyle(fontSize: 15, color: Colors.blue),
            ),
          ),
          Divider(
            color: Colors.grey[400],
          ),
         // com(link: fun_live.data.id.toString()),
        ],
      ),
    );
  }
}
