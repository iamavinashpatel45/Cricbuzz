import 'package:cricket/callapi.dart';
import 'package:cricket/jsontodart.dart';
import 'package:flutter/material.dart';

class myapp extends StatefulWidget {
  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  List? data;

  getdata() async {
    data = jason_to_dart
        .fromJson(
          await appicall.apicall(
              s: 'https://api.cricapi.com/v1/series?apikey=95c00616-5fb8-49ba-b4dc-4a9a830a9872&offset=0',
              request: Map<String, dynamic>()),
        )
        .data;

    setState(() {});
    print('Avinash');
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'asstes/logo.png',
            height: 130,
          ),
        ),
      ),
      body: data?.length == null
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.grey[200],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    var d = data![index];
                    return Card(
                      borderOnForeground: false,
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(
                            d.name,
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
                                      "ODI: " + d.odi.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "T20: " + d.t20.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "TEST: " + d.test.toString(),
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
                                      "StartDate: " + d.startDate.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "EndDate: " + d.endDate.toString(),
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
