import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Survey extends StatefulWidget {
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Text(
            " لو محتاج مساعدة أبعتلنا بياناتك  وهنكلمك",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          SizedBox(
            height: 20,
          ),
          Center(
            child: RaisedButton(
              onPressed: _launchURL,
              child: Text('اضغط هنا'),
            ),
          ),
        ],
      ),
    );
  }
}

_launchURL() async {
  const url =
      'https://www.surveymonkey.com/r/BPL9Y7B?fbclid=IwAR1LsT0QSJKtahh5JYPoPNPY33s8ZXgvMhOLIp4Wc7cKaQD0OgM_XZFFluw';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
