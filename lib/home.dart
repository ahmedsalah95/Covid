import 'package:corona/form.dart';
import 'package:corona/survey.dart';
import 'package:flutter/material.dart';
import 'QA.dart';
import 'Stats.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  var data;
  var global;
  var NewConfirmed;
  var TotalConfirmed;
  var NewDeaths;
  var TotalDeaths;
  var NewRecovered;
  var TotalRecovered;

  Future getData() async {
    http.Response response =
        await http.get("https://api.covid19api.com/summary");
    data = json.decode(response.body);
    setState(() {
      global = data["Global"];
      NewConfirmed = global["NewConfirmed"];
      TotalConfirmed = global["TotalConfirmed"];
      NewDeaths = global["NewDeaths"];
      TotalDeaths = global["TotalDeaths"];
      NewRecovered = global["NewRecovered"];
      TotalRecovered = global["TotalRecovered"];
    });

    print(NewConfirmed);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  int _index = 0;

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
                    "محتاج مساعدة؟",
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
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage(
                        'assets/virus.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Center(
                  child: Text(
                "مرض فيروس كورونا (كوفيد-19) هو مرض معدٍ يسببه فيروس جديد لم يُكتشف في البشر من قبل ، ويسبب الفيروس مرض الجهاز التنفسي (مثل الأنفلونزا) المصحوب بأعراض مثل السعال والحمى، كما يسبب الالتهاب الرئوي في الحالات الأشد وخامة. ويمكنك حماية نفسك بالمواظبة على غسل اليدين وتحاشي لمس الوجه.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "إحصائيات عالمية ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ListTile(
                        leading: Icon(
                          Icons.check_box,
                          color: Colors.black,
                        ),
                        title: Text(
                          " ${NewConfirmed == null ? 'جاري التحميل...' : NewConfirmed}   : الحالات الجديدة  ",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_box,
                        color: Colors.black,
                      ),
                      title: Text(
                        "  ${TotalConfirmed == null ? 'calculating...' : TotalConfirmed}  : مجموع الحالات ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_box,
                        color: Colors.black,
                      ),
                      title: Text(
                        "${NewDeaths == null ? 'calculating...' : NewDeaths}  : الوفيات الجديدة  ",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_box,
                        color: Colors.black,
                      ),
                      title: Text(
                        " ${TotalDeaths == null ? 'calculating...' : TotalDeaths}  :   مجموع الوفيات",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_box,
                        color: Colors.black,
                      ),
                      title: Text(
                        " ${NewRecovered == null ? 'calculating...' : NewRecovered}    : المتعافين ",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_box,
                        color: Colors.black,
                      ),
                      title: Text(
                        " ${TotalRecovered == null ? 'calculating...' : TotalRecovered} : مجموع المتعافين ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "احصائيات منظمة الصحه العالمية ",
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
