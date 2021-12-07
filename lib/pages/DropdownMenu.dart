// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DropdownMenu extends StatelessWidget {
  const DropdownMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("DropdownMenu")),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
                children: [
                  Row(
                    children: [Menu()],
                  ),
                  Row(),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center)
          ],
        )));
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
  final bool _flag;
  final String _name;

  late IconData _icon;
  late Color _color;
  late Color _backgroundColor;

  @override
  _MenuItemState(this._flag, this._name);

  @override
  void initState() {
    super.initState();
    switch (_flag) {
      case true:
        setState(() {
          _icon = Icons.keyboard_arrow_down_sharp;
          _color = Colors.white;
          _backgroundColor = Colors.black;
        });
        break;
      case false:
        setState(() {
          _icon = Icons.keyboard_arrow_up_sharp;
          _color = Colors.black;
          _backgroundColor = Colors.white;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        child: Row(
          children: [
            SizedBox(width: 15),
            Text(
              _name,
              style:
                  TextStyle(fontSize: 16, fontFamily: 'roboto', color: _color),
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
        ));
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
