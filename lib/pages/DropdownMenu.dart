// ignore_for_file: file_names
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DropdownMenu extends StatelessWidget {
  DropdownMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("DropdownMenu")),
        backgroundColor: Color(0xFFECEFF8),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Menu(),
                  SizedBox(
                    height: 5,
                  ),
                  Content(),
                ],
                mainAxisAlignment: MainAxisAlignment.center),
          ],
        ));
  }
}

class Content extends StatelessWidget {
  const Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 42, vertical: 57),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Help",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto')),
                    SizedBox(height: 22),
                    Card(
                        info: CardInfo(
                            color: Color(0xFFFFEFF3),
                            des:
                                "Learn how to sign up, install and use our products.",
                            name: "Help Center",
                            icon: Icons.import_contacts_outlined)),
                    SizedBox(height: 15),
                    Card(
                        info: CardInfo(
                            color: Color(0xFFEFF2FF),
                            des: "Learn, share and connect with other users.",
                            name: "Coimmunity Forum",
                            icon: Icons.people_outline)),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Learn",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto')),
                    SizedBox(height: 22),
                    Card(
                        info: CardInfo(
                            color: Color(0xFFE9FBED),
                            des:
                                "Learn how to sign up, install and use our products.",
                            name: "Podcasts",
                            icon: Icons.headset_outlined)),
                    SizedBox(height: 15),
                    Card(
                        info: CardInfo(
                            color: Color(0xFFFBF3E3),
                            des: "Learn, share and connect with other users.",
                            name: "Coimmunity Forum",
                            icon: Icons.question_answer_outlined)),
                  ],
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
        ),
        Container(
          color: Color(0xFFECEFF8),
          child: SizedBox(
            width: 91,
          ),
        )
      ],
    );
  }
}

class CardInfo {
  IconData icon;
  String name;
  String des;
  Color color;

  CardInfo(
      {required this.icon,
      required this.name,
      required this.des,
      this.color = Colors.white});
}

class Card extends StatefulWidget {
  CardInfo info;
  bool bSelect;

  Card({required this.info, this.bSelect = false});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  void exitFunction(PointerExitEvent event) {
    setState(() {
      this.widget.bSelect = false;
    });
  }

  void hoverFunction(PointerHoverEvent event) {
    setState(() {
      this.widget.bSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: hoverFunction,
      onExit: exitFunction,
      child: InkWell(
        onTap: () => {},
        child: Container(
          width: 308,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: this.widget.bSelect == true
                ? this.widget.info.color
                : Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    CircleAvatar(
                        radius: 20,
                        backgroundColor: this.widget.info.color,
                        child: Icon(
                          widget.info.icon,
                          color: Colors.black,
                        )),
                    SizedBox(height: 31)
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 17,
                      ),
                      Text("${widget.info.name}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto')),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.info.des}",
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  final bool _flag;
  final String _name;

  @immutable
  MenuItem(this._flag, this._name);

  @override
  _MenuItemState createState() => _MenuItemState(this._flag, this._name);
}

class _MenuItemState extends State<MenuItem> {
  bool _flag;
  final String _name;

  late IconData _icon;
  late Color _color;
  late Color _backgroundColor;

  @override
  _MenuItemState(this._flag, this._name);

  @override
  void initState() {
    super.initState();

    setState(() {
      _icon = Icons.keyboard_arrow_up_sharp;
      _color = Colors.black;
      _backgroundColor = Color(0xFFECEFF8);
    });
  }

  void exitFunction(PointerExitEvent event) {
    setState(() {
      _icon = Icons.keyboard_arrow_up_sharp;
      _color = Colors.black;
      _backgroundColor = Color(0xFFECEFF8);
    });
  }

  void hoverFunction(PointerHoverEvent event) {
    setState(() {
      _icon = Icons.keyboard_arrow_down_sharp;
      _color = Colors.white;
      _backgroundColor = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: hoverFunction,
      onExit: exitFunction,
      child: InkWell(
        onTap: () => {},
        child: Container(
            height: 45,
            child: Row(
              children: [
                SizedBox(width: 15),
                Text(
                  _name,
                  style: TextStyle(
                      fontSize: 16, fontFamily: 'roboto', color: _color),
                ),
                Icon(
                  _icon,
                  color: _color,
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _backgroundColor,
            )),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Row(
      children: [
        MenuItem(false, "Products"),
        SizedBox(width: 33),
        MenuItem(false, "Solutions"),
        SizedBox(width: 33),
        MenuItem(true, "Resources"),
        SizedBox(width: 33),
        MenuItem(false, "Pricing"),
      ],
    ));
  }
}
