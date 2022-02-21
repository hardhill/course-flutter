import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color-model.dart';
import 'colorolled-box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _selected = false;

    return ChangeNotifierProvider<MyColor>.value(
      value: MyColor(),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<MyColor>(
            builder: (context, mycolor, _) {
              return Text(
                "Course app",
                style: TextStyle(
                  color: mycolor.getColor(),
                ),
              );
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColorolledBox(),
              Consumer<MyColor>(
                builder: (context, instance, child) {
                  return Switch(
                    value: _selected,
                    onChanged: (value) {
                      print(value);
                      _selected = value;
                      instance.setColor(value);
                      print(instance.getColor());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
