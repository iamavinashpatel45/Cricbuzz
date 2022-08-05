import 'package:auto_size_text/auto_size_text.dart';
import 'package:cricket/fun/fun.dart';
import 'package:cricket/fun/fun_news.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class news extends StatefulWidget {
  const news({Key? key}) : super(key: key);

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
  GlobalKey<RefreshIndicatorState> global_key =
      new GlobalKey<RefreshIndicatorState>();

  Future<void> lunch_url(String str) async {
    try {
      Uri url = Uri.parse(str);
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    } catch (e) {}
  }

  set() async {
    fun.internet = await fun.checkInternet();
    setState(() {});
    if (fun.internet == true) {
      await fun_news.getdata();
    }
    setState(() {
      Fluttertoast.showToast(msg: "To Get More Details Tap on.");
    });
  }

  @override
  void initState() {
    set();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 0, 180, 137),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 180, 137),
        title: Text('Sports News'),
        elevation: 2,
      ),
      body: fun.internet == true
          ? fun_news.data == null
              ? Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 0, 180, 137),
                  ),
                )
              : RefreshIndicator(
                  key: global_key,
                  onRefresh: () => set(),
                  child: ListView.builder(
                      itemCount: fun_news.data.length,
                      itemBuilder: (context, index) {
                        var d = fun_news.data[index];
                        return d.title == null
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 5),
                                child: Card(
                                  elevation: 15,
                                 // color: Colors.grey[300],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await lunch_url(d.url);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                              color: Colors.black, width: 0.5)),
                                      child: ListTile(
                                        title: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(width: 1)),
                                            child: Material(
                                              elevation: 8,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                child: Text(
                                                  d.title,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 2,
                                            ),
                                            d.urlToImage == null
                                                ? Container()
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    child: Material(
                                                      elevation: 5,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              3.5,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 1),
                                                                  image:
                                                                      DecorationImage(
                                                                    image: AssetImage(
                                                                        'asstes/app_icon.jpg'),
                                                                  )),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: Image.network(
                                                                d.urlToImage,
                                                                fit: BoxFit
                                                                    .fill),
                                                          )),
                                                    ),
                                                  ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(width: 1)),
                                              child: Material(
                                                elevation: 2,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  child: Text(
                                                    d.description == null
                                                        ? ''
                                                        : d.description,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            Text(
                                              d.source.name == null
                                                  ? ""
                                                  : "Source : " + d.source.name,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      }))
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Whoops!',
                    style: TextStyle(fontSize: 40),
                  ),
                  AutoSizeText(
                    '  No Internet Connection Found  ',
                    style: TextStyle(fontSize: 25),
                    maxLines: 1,
                  ),
                  Text(
                    'Check Your Internet',
                    style: TextStyle(fontSize: 25),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        set();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: Text(
                        'Try Again',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
    );
  }
}
