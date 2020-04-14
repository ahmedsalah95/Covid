import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home.dart';


void main(){
  runApp(new MaterialApp(
   debugShowCheckedModeBanner: false,
    home: Directionality(textDirection: TextDirection.rtl, child: MyApp()) ,

  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds:  mainPage(),
        title: Text("Covid-19",
        style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
        ),

        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.black
    );
  }
}




