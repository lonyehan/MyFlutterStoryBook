import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  bool? option1;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    setState(() {
      widget.option1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PricingCard"),
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 666),
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.all(75),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Try it now!",
                    style: GoogleFonts.merriweather(
                        fontWeight: FontWeight.bold, fontSize: 42),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Free trial, no obligation",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Work email address",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color(0xFF6D6D6D))),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        minLines: 1,
                        decoration: InputDecoration(
                            hintText: "Enter your work email address",
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000), width: 2),
                                borderRadius: BorderRadius.circular(4)),
                            border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Option(
                    describe: [
                      OptionDes("I agree to the"),
                      OptionDes("Terms and Conditions", bHightLight: true),
                      OptionDes("."),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Option(describe: [
                    OptionDes("Subscribe to newsletters and communications.")
                  ]),
                  SizedBox(
                    height: 25,
                  ),
                  Option(describe: [
                    OptionDes("Subscribe to trial onboarding emails.")
                  ]),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () => {},
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 157),
                        child: Text("DOWNLOAD NOW",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 18)),
                      ))),
                  SizedBox(
                    height: 25,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text:
                            "We value your privacy and you have complete control over any information submitted. For more information see our ",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 16)),
                    TextSpan(
                        text: "privacy policy",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xFF4067F3))),
                    TextSpan(
                        text: ".",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 16)),
                  ]))
                ],
              ),
            ),
          ),
        ));
  }
}

class OptionDes {
  late String text;
  late Color color;

  OptionDes(this.text, {bool bHightLight = false}) {
    this.color = bHightLight == true ? Color(0xFF4067F3) : Colors.black;
  }
}

class Option extends StatefulWidget {
  List<OptionDes> describe;

  Option({Key? key, required this.describe}) : super(key: key);

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  late bool? option = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Color(0xFFFF71A4),
          value: option,
          onChanged: (value) => {
            setState(() {
              option = value;
            })
          },
        ),
        RichText(
            text: TextSpan(
          children: widget.describe
              .map((e) => TextSpan(
                  text: "${e.text}",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: e.color)))
              .toList(),
        ))
      ],
    );
  }
}
