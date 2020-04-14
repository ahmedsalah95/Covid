import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Country extends StatefulWidget {
  final countryName;

  const Country(this.countryName);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  var data;
  var Country;
  var confirmed;
  var deaths;
  var recovered;

  Future getData() async {
    http.Response response = await http.get(
        "https://api.covid19api.com/live/country/${widget.countryName}/status/confirmed");
    data = json.decode(response.body);
    setState(() {
      Country = data[0]["Country"];
      confirmed = data[0]["Confirmed"];
      deaths = data[0]["Deaths"];
      recovered = data[0]["Recovered"];
    });
    print(Country.toString());
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
        title: Center(child: Text(widget.countryName)),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left: 50,bottom: 20),
              child: ListTile(
                  leading: Icon(Icons.check_box,color: Colors.black,),
                  title: Text(
                    " ${confirmed == null ? 'جاري البحث...' : confirmed}  : الحالات المؤكده ",
                    style: TextStyle(
                        fontSize: 20
                    ),)
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 50,bottom: 20),
              child: ListTile(
                leading: Icon(Icons.clear,color: Colors.black,),
                title:  Text(" ${deaths == null ? 'جاري البحث...' : deaths}  : الوفيات ",
                  style: TextStyle(
                      fontSize: 20
                  ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: ListTile(
                leading: Icon(Icons.favorite,color: Colors.red,),
                title:  Text(
                  " ${recovered == null ? 'جاري البحث...' : recovered}  :  المتعافين ",
                  style: TextStyle(
                      fontSize: 20
                  ),),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
