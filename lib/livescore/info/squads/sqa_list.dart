import 'package:cricket/fun/fun_info.dart';
import 'package:flutter/material.dart';

class sqa_list extends StatefulWidget {
  final int ind;

  const sqa_list({Key? key, required this.ind}) : super(key: key);

  @override
  State<sqa_list> createState() => _sqa_listState();
}

class _sqa_listState extends State<sqa_list> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return fun_info.data?.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: fun_info.data[widget.ind].players.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var d = fun_info.data[widget.ind].players[index];
                      return ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image.network(d.playerImg)),
                        title: Text(d.name),
                        subtitle: Text(d.role),
                      );
                    }),
              ),
            ],
          );
  }
}
