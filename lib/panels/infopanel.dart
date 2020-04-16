import 'package:covid19_tracker/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../datasource.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FAQPage()));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: primaryBlack, borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'FAQ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launch(
                  'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: primaryBlack, borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'DONATE (W.H.O)',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launch('https://pmnrf.gov.in/en/online-donation');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: primaryBlack, borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'DONATE (India PMCare Fund)',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launch(
                  'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: primaryBlack, borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'MYTH BUSTER',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
