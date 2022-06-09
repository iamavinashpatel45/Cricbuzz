import 'package:cricket/fun/fun.dart';
import 'package:flutter/material.dart';

class myapp extends StatefulWidget {
  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 180, 137),
      body: fun.data2?.length == null
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: fun.data2?.length,
                  itemBuilder: (context, index) {
                    var d = fun.data2![index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      borderOnForeground: false,
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(
                            d['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ODI: " + d['odi'].toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "T20: " + d['t20'].toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "TEST: " + d['test'].toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "StartDate: " + d['startDate'].toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "EndDate: " + d['endDate'].toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
