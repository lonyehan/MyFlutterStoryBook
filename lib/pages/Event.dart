import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  const Event({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main')),
      backgroundColor: Color(0xFFECEFF8),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Notice(
                Color(0xFFECEFF8),
                "TODAY",
                "17:00",
                "Bergen International Film Festival",
                "Films from all over the world gather all film enthusiasts for unique moments at the Bergen International Film Festival."),
            Notice(Color(0xFFF8ECF8), "22 - 31 Oct", "10:00", "Wool week",
                "ULLVEKA 2021 will be held for the eighth time in the period 22 - 31 October 2021, and will take place in the entire Bergen region.",
                btnColor: Colors.white, btnBgColor: Colors.black),
            Notice(
                Color(0xFFF8ECEC),
                "22 - 31 Oct",
                "19:00",
                "Light park at Bergenhus Fortress",
                "ULLVEKA 2021 will be held for the eighth time in the period 22 - 31 October 2021, and will take place in the entire Bergen region."),
            Notice(
                Color(0xFFEEF8EC),
                "13 - 31 Dec",
                "10:00",
                "Gingerbread City 2021",
                "The world's largest Gingerbread Town can be found in the Xhibition shopping center, right in the center of Bergen")
          ])),
    );
  }
}

class Date extends StatelessWidget {
  Date(this.color, this.date, this.time);

  final Color color;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 133.0,
      width: 152.0,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(this.date),
            SizedBox(height: 5),
            Text(this.time,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))
          ]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
    );
  }
}

class Describe extends StatelessWidget {
  Describe(this.title, this.content);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93,
      width: 527.0,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(this.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 14),
            Text(this.content, softWrap: true)
          ]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class Button extends StatefulWidget {
  Button({Key? key}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _active = false;
  late Color color;
  late Color backcolor;

  void buttonClick() {
    setState(() {
      _active = !_active;
      color = _active ? Colors.white : Colors.black;
      backcolor = _active ? Colors.black : Colors.white;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      color = Colors.black;
      backcolor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buttonClick();
      },
      child: Container(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.add, color: color),
              onPressed: () {},
            ),
            Text('Add to calendar',
                style: TextStyle(
                  color: color,
                )),
            SizedBox(width: 10)
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backcolor,
        ),
      ),
    );
  }
}

class Notice extends StatelessWidget {
  Notice(this.color, this.date, this.time, this.title, this.content,
      {this.btnColor = Colors.black, this.btnBgColor = Colors.white});

  final String date;
  final String time;
  final Color color;
  final String title;
  final String content;
  final Color btnColor;
  final Color btnBgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Container(
          height: 173,
          width: 1047,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Date(color, date, time),
                  SizedBox(width: 30),
                  Describe(title, content),
                  SizedBox(width: 30),
                  Button(),
                  SizedBox(width: 10)
                ]),
          ),
        ));
  }
}
