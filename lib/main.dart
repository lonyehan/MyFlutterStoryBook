import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_flutter_app/pages/DropdownMenu.dart';
import 'package:my_first_flutter_app/pages/PricingCard.dart';

import 'pages/Event.dart';
import 'pages/DropdownMenu.dart';
import 'pages/PricingCard.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/day01': (BuildContext context) => const Event(),
          '/day02': (BuildContext context) => const DropdownMenu(),
          '/day03': (BuildContext context) => const PricingCard(),
          '/daily_prototype': (BuildContext context) => const DailyPrototype(),
        },
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext context) => const Home();
              break;
            case '/daily_prototype':
              builder = (BuildContext context) => const DailyPrototype();
              break;
            case '/day01':
              builder = (BuildContext context) => const Event();
              break;
            case '/day02':
              builder = (BuildContext context) => const DropdownMenu();
              break;
            case '/day03':
              builder = (BuildContext context) => const PricingCard();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute<void>(builder: builder, settings: settings);
        });
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              leading: Icon(Icons.apps),
              title: Text(
                "Daliy Prototype",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: () => {Navigator.pushNamed(context, '/daily_prototype')},
            )
          ],
        ),
      ),
    );
  }
}

class DailyPrototype extends StatelessWidget {
  const DailyPrototype({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("DaliyPrototype"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("Lonyehan"),
                accountEmail: Text("lonyehan@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: Text("L"),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.apps),
                title: const Text(
                  "Daliy Prototype",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                onTap: () =>
                    {Navigator.of(context).pushNamed('/daily_prototype')},
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
            crossAxisCount: 10,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              DaliyButton(name: "Day01", route: "/day01"),
              DaliyButton(name: "Day02", route: "/day02"),
              DaliyButton(name: "Day03", route: "/day03"),
            ],
          ),
        ));
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
          onPressed: () => {Navigator.of(context).pushNamed(route)}),
    );
  }
}
