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
    if (fun.internet == true) {
      setState(() {});
      await fun_news.getdata();
    }
    setState(() {});
  }

  @override
  void initState() {
    set();
    Fluttertoast.showToast(msg: "To Get More Details Tab It.");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 180, 137),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 180, 137),
        title: Text('Cricket News'),
        elevation: 1,
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
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        var d = fun_news.data[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: InkWell(
                              onTap: () async {
                                await lunch_url(d.url);
                              },
                              child: ListTile(
                                title: Text(
                                  d.title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    d.urlToImage == null
                                        ? Container()
                                        : Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                30,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: AssetImage(
                                                  'asstes/app_icon.jpg'),
                                            )),
                                            child: Image.network(
                                              d.urlToImage,
                                              fit: BoxFit.fill,
                                            )),
                                    Text(d.description,style: TextStyle(
                                      color: Colors.black,
                                    ),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Source : " + d.source.name,
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
                  Text(
                    'No Internet Connection Found',
                    style: TextStyle(fontSize: 25),
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
