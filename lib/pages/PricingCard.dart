// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingCard extends StatelessWidget {
  PricingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PricingCard"),
        ),
        body: Center(
          child: Container(
            width: 1098,
            height: 544,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(23),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xFFF4F6FA)),
                child: Padding(
                  padding: EdgeInsets.all(67),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PricingCardItem(
                          info: PricingCardInfo(
                              level: "Free",
                              price: 0,
                              levelDes: "Free for your whole team",
                              levelDetail:
                                  "For individuals or teams looking to organize anything.",
                              buttonInfo: "Get started",
                              buttonColor: Color(0xFFEDBBFF))),
                      SizedBox(
                        width: 45,
                      ),
                      PricingCardItem(
                          info: PricingCardInfo(
                              level: "Standard",
                              price: 6,
                              levelDes: "Per user per month",
                              levelDetail:
                                  "For teams that need to manage more work.",
                              buttonInfo: "Upgrade Now",
                              buttonColor: Color(0xFFAEF1F5))),
                      SizedBox(
                        width: 45,
                      ),
                      PricingCardItem(
                          info: PricingCardInfo(
                              level: "Premium",
                              price: 12,
                              levelDes: "Per user per month",
                              levelDetail:
                                  "Best for teams that need to track multiple projects.",
                              buttonInfo: "Try for free",
                              buttonColor: Color(0xFFFFDDB6))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class PricingCardInfo {
  String level;
  int price;
  String levelDes;
  String levelDetail;
  String buttonInfo;
  Color buttonColor;

  PricingCardInfo(
      {required this.level,
      required this.price,
      required this.levelDes,
      required this.levelDetail,
      required this.buttonInfo,
      required this.buttonColor});
}

class PricingCardItem extends StatelessWidget {
  final PricingCardInfo info;

  const PricingCardItem({required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 276,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${info.level}",
            style: GoogleFonts.merriweather(
                fontWeight: FontWeight.bold, fontSize: 26),
          ),
          SizedBox(
            height: 21,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "\$",
              style: GoogleFonts.ibmPlexSans(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            TextSpan(
                text: "${info.price}",
                style: GoogleFonts.ibmPlexSans(
                    fontWeight: FontWeight.bold, fontSize: 62)),
          ])),
          Text("${info.levelDes}",
              style: GoogleFonts.ibmPlexSans(
                  fontWeight: FontWeight.w600, fontSize: 16)),
          SizedBox(
            height: 40,
          ),
          Text("${info.levelDetail}",
              style: GoogleFonts.ibmPlexSans(
                  fontWeight: FontWeight.w600, fontSize: 20)),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () => {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Text(
                "${info.buttonInfo}",
                style: GoogleFonts.ibmPlexSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
            style: ElevatedButton.styleFrom(primary: info.buttonColor),
          ),
        ],
      ),
    );
  }
}
