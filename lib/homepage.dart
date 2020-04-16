import 'dart:convert';

import 'package:covid19_tracker/datasource.dart';
import 'package:covid19_tracker/pages/countryPage.dart';
import 'package:covid19_tracker/panels/infopanel.dart';
import 'package:covid19_tracker/panels/mosteffectedcountry.dart';
import 'package:covid19_tracker/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'Covid-19 Tracker',
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(
                  color: Colors.orange[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'WorldWide',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryPage()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: primaryBlack,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Regional',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
            worldData == null
                ? CircularProgressIndicator()
                : WorldWidePanel(
                    WorldData: worldData,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                ' Most Affected Countries',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            countryData == null
                ? Container()
                : MostAffectedPanel(
                    countryData: countryData,
                  ),
            InfoPanel(),
            SizedBox(height: 20),
            Center(
                child: Text('WE ARE TOGETHER IN THIS FIGHT',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
            SizedBox(
              height: 50,
            )
          ],
        )));
  }
}
