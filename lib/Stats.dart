import 'package:corona/survey.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'Country.dart';
import 'QA.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  Map data;
  List Countries;
  var globalData;

  Future getData() async {
    http.Response response =
        await http.get("https://api.covid19api.com/summary");
    data = json.decode(response.body);
    setState(() {
      globalData = data["Global"];
      Countries = data["Countries"];
    });
   // debugPrint(globalData.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: new Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Stats()),
                  );
                },
                leading: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Icon(Icons.filter_frames),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "احصائيات",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Survey()),
                  );
                },
                leading: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Icon(Icons.local_hospital),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    " مساعدة",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionsAndAnswers()),
                  );
                },
                leading: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Icon(Icons.question_answer),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "أسئلة شائعة",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: Countries == null ? 0 : Countries.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Country(Countries[index]["Country"]),
                    ));
              },
              leading: Text("${Countries[index]["Country"]}"),
              title: Text("Confirmed : ${Countries[index]["TotalConfirmed"]}"),
            );
          },
        ));
  }
}
