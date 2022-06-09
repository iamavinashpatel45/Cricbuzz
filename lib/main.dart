import 'package:cricket/livematch/live_score.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
 // FlutterNativeSplash.removeAfter((time));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: live_score(),
  ));
}


class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  gohome()async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>live_score()));
  }

  @override
  void initState() {
    gohome();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 180, 137),
      body: Center(
        child: Image.asset('asstes/green_logo.png'),
      ),
    );
  }
}

// gohome()async{
//   await Future.delayed(Duration(seconds: 3));
//   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>live_score()));
// }