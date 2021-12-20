// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackDialog extends StatefulWidget {
  FeedbackDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  bool? _privatePolicy;
  bool? _reasearchGroup;

  @override
  void initState() {
    super.initState();
    _privatePolicy = false;
    _reasearchGroup = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FeedbackDialog")),
      backgroundColor: Color(0xFFF2F6FF),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 666),
          decoration: BoxDecoration(
              color: Color(0xFFF8FAFF),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: EdgeInsets.all(75),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Give feedback",
                  style: GoogleFonts.merriweather(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "What do you think of the issue search experience within Jira projects?",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  height: 31,
                ),
                Row(
                  children: [
                    FaceOption(
                        Icons.sentiment_very_dissatisfied_rounded, "Terrible"),
                    Spacer(),
                    FaceOption(Icons.sentiment_dissatisfied_rounded, "Bad"),
                    Spacer(),
                    FaceOption(Icons.sentiment_neutral_rounded, "Okay"),
                    Spacer(),
                    FaceOption(Icons.sentiment_satisfied_alt_rounded, "Good"),
                    Spacer(),
                    FaceOption(
                        Icons.sentiment_very_satisfied_rounded, "Amazing"),
                  ],
                ),
                SizedBox(
                  height: 31,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What are the main reasons for your rating?",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: TextField(
                        minLines: 3,
                        maxLines: null,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFE5EDFF), width: 2),
                                borderRadius: BorderRadius.circular(5)),
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 31,
                ),
                Column(children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Color(0xFFFF71A4),
                        value: _privatePolicy,
                        onChanged: (value) => {
                          setState(() {
                            _privatePolicy = value;
                          })
                        },
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "I may be contacted about this feedback.",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 14)),
                        TextSpan(
                            text: "Privacy Policy",
                            style: GoogleFonts.poppins(
                                color: Color(0xFFD22E69),
                                fontWeight: FontWeight.w500,
                                fontSize: 14))
                      ]))
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Color(0xFFFF71A4),
                        value: _reasearchGroup,
                        onChanged: (value) => {
                          setState(() {
                            _reasearchGroup = value;
                          })
                        },
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "I’d like to help improve by joining the ",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 14)),
                        TextSpan(
                            text: "Reasearch Group",
                            style: GoogleFonts.poppins(
                                color: Color(0xFFD22E69),
                                fontWeight: FontWeight.w500,
                                fontSize: 14)),
                        TextSpan(
                            text: ".",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 14)),
                      ]))
                    ],
                  )
                ]),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FeedbackButton("Submit", Color(0xFFFF71A4), Colors.white),
                    SizedBox(
                      width: 16,
                    ),
                    FeedbackButton("Cancel", Colors.white, Color(0xFF60699A))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeedbackButton extends StatelessWidget {
  final String content;
  final Color backgroundColor;
  final Color color;

  FeedbackButton(this.content, this.backgroundColor, this.color);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: backgroundColor),
        onPressed: () => {},
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Text(
            content,
            style: GoogleFonts.poppins(
                color: color, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ));
  }
}

class FaceOption extends StatefulWidget {
  IconData icon;
  String Des;

  FaceOption(this.icon, this.Des);

  @override
  State<FaceOption> createState() => _FaceOptionState();
}

class _FaceOptionState extends State<FaceOption> {
  late Color borderColor;

  void hoverFunction(PointerHoverEvent event) {
    setState(() {
      borderColor = Color(0xFFFF71A4);
    });
  }

  void exitFunction(PointerExitEvent event) {
    setState(() {
      borderColor = Color(0xFFE5EDFF);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      borderColor = Color(0xFFE5EDFF);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: hoverFunction,
      onExit: exitFunction,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 22),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 44,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.Des,
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                )
              ]),
        ),
      ),
    );
  }
}
