// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PricingCard extends StatelessWidget {
  const PricingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PricingCard"),
        ),
        body: Center(
          child: Container(
            width: 1098,
            height: 544,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(23),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xFFF4F6FA)),
                child: Padding(
                  padding: const EdgeInsets.all(67),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 276,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Free",
                              style: TextStyle(
                                  fontFamily: "Merriweather",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26),
                            ),
                            SizedBox(
                              height: 21,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$0",
                                  style: TextStyle(
                                      fontFamily: "IBM Plex Sans",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 62),
                                ),
                              ],
                            ),
                            Text("Free for your whole team",
                                style: TextStyle(
                                    fontFamily: "IBM Plex Sans",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                                "For individuals or teams looking to organize anything.",
                                style: TextStyle(
                                    fontFamily: "IBM Plex Sans",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20)),
                            SizedBox(
                              height: 50,
                            ),
                            TextButton(
                              onPressed: () => {},
                              child: Text("Get started",
                                  style: TextStyle(color: Colors.black)),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFFEDBBFF)),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(20)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
