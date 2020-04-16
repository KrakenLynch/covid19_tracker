import 'dart:convert';

import 'package:covid19_tracker/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
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
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed:(){
            showSearch(context: context, delegate: Search(countryData));
          },)
        ],
        title: Text('Country Stats'),
      ),
      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 130,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey[100],
                          blurRadius: 10,
                          offset: Offset(0, 10)),
                    ]),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                countryData[index]['country'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Image.network(
                                  countryData[index]['countryInfo']['flag'],
                                  height: 60,
                                  width: 80),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Confirmed:' +
                                    countryData[index]['cases'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[600]),
                              ),
                              Text(
                                'Active:' +
                                    countryData[index]['active'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[600]),
                              ),
                              Text(
                                'Recovered:' +
                                    countryData[index]['recovered'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[600]),
                              ),
                              Text(
                                'Deaths:' +
                                    countryData[index]['deaths'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
