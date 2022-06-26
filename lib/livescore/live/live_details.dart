import 'package:cricket/fun/fun_live.dart';
import 'package:cricket/livescore/live/finish_match.dart';
import 'package:cricket/livescore/live/live_match.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class live_details extends StatefulWidget {
  final String? link;

  const live_details({Key? key, required this.link}) : super(key: key);

  @override
  State<live_details> createState() => _live_detailsState();
}

class _live_detailsState extends State<live_details> {
  int index = fun_live.data.score.length - 1;
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
      child: fun_live.status == true ? finish_match() : live_match_2(),
    );
  }
}
