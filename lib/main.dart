import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/pages/DropdownMenu.dart';

import 'pages/Event.dart';
import 'pages/DropdownMenu.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/day01': (BuildContext context) => const HomePage(),
          '/day02': (BuildContext context) => const DropdownMenu(),
        },
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext context) => const Event();
              break;
            case '/day01':
              (BuildContext context) => const Event();
              break;
            case '/day02':
              builder = (BuildContext context) => const DropdownMenu();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute<void>(builder: builder, settings: settings);
        });
  }
}
