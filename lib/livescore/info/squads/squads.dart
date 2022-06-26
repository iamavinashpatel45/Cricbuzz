import 'package:cricket/fun/fun_info.dart';
import 'package:cricket/livescore/info/squads/sqa_list.dart';
import 'package:flutter/material.dart';

class squads extends StatefulWidget {
  final int index;

  const squads({Key? key, required this.index}) : super(key: key);

  @override
  State<squads> createState() => _squadsState();
}

class _squadsState extends State<squads> {
  int? ind;

  get(int x) {
    ind = x;
  }

  @override
  void initState() {
    get(widget.index);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: ind!,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Color.fromARGB(255, 0, 180, 137),
          elevation: 1,
          title: Text('Squads'),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            tabs: [
              Tab(
                text: fun_info.data[0].teamName,
              ),
              Tab(
                text: fun_info.data[1].teamName,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            sqa_list(ind: 0),
            sqa_list(ind: 1),
          ],
        ),
      ),
    );
  }
}
