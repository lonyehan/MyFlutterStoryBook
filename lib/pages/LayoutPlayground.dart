import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:redux_saga/redux_saga.dart';

class LayoutPlayground extends StatelessWidget {
  const LayoutPlayground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        // mobile
        return Scaffold(
          appBar: AppBar(title: const Text('我是手機')),
          body: Column(
            children: [
              Card(child: Text("卡片一號")),
              Card(child: Text("卡片二號")),
              Card(child: Text("卡片三號")),
              Card(child: Text("卡片四號")),
            ],
          ),
        );
        //const Text("我是手機");
      } else if (constraints.maxWidth < 800) {
        // ipad
        return Scaffold(
          appBar: AppBar(title: const Text('我是平板')),
          body: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 3,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(
                6,
                (index) {
                  return Center(
                    child: Card(child: Text("卡片${index}號")),
                  );
                },
              )),
        );
      } else {
        // desktop
        return const Text("我是桌面應用程式");
      }
    });
  }
}
