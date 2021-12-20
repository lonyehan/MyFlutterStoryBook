// ignore_for_file: equal_keys_in_map

// package
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_flutter_app/pages/SignUp.dart';
import 'package:go_router/go_router.dart';
// import 'package:redux_saga/redux_saga.dart';

// components
import 'pages/Event.dart';
import 'pages/DropdownMenu.dart';
import 'pages/PricingCard.dart';
import 'pages/FeedbackDialog.dart';
import 'dart:html' as html;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
        path: '/daily_prototype',
        builder: (context, state) => HomePage(widget: DailyPrototype()),
        routes: [
          GoRoute(
            path: 'day01',
            builder: (context, state) => Event(),
          ),
          GoRoute(
            path: 'day02',
            builder: (context, state) => DropdownMenu(),
          ),
          GoRoute(
            path: 'day03',
            builder: (context, state) => PricingCard(),
          ),
          GoRoute(
            path: 'day04',
            builder: (context, state) => FeedbackDialog(),
          ),
          GoRoute(
            path: 'day05',
            builder: (context, state) => SignUp(),
          ),
        ])
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate);
  }
}

class HomePage extends StatefulWidget {
  Widget? widget;
  HomePage({this.widget});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Lonyehan"),
              accountEmail: Text("lonyehan@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text("L"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: () => {context.go('/')},
            ),
            ListTile(
              leading: Icon(Icons.apps),
              title: Text(
                "Daliy Prototype",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: () => {context.go('/daily_prototype')},
            )
          ],
        ),
      ),
      body: widget.widget,
    );
  }
}

class DailyPrototype extends StatelessWidget {
  DailyPrototype({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 10,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          DaliyButton(name: "Day01", route: "/daily_prototype/day01"),
          DaliyButton(name: "Day02", route: "/daily_prototype/day02"),
          DaliyButton(name: "Day03", route: "/daily_prototype/day03"),
          DaliyButton(name: "Day04", route: "/daily_prototype/day04"),
          DaliyButton(name: "Day05", route: "/daily_prototype/day05"),
        ],
      ),
    );
  }
}

class DaliyButton extends StatelessWidget {
  final String name;
  final String route;

  DaliyButton({required this.name, required this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.pink[50], borderRadius: BorderRadius.circular(30)),
      child: TextButton(
          child: Text(
            name,
            style: GoogleFonts.ibmPlexSans(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          onPressed: () => {context.go(route)}),
    );
  }
}
