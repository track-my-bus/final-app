import 'package:flutter/material.dart';
import 'package:trackmybusapp/showPage.dart';
import 'package:trackmybusapp/stops.dart';
import 'listPage.dart';
import 'mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Stops(),
        routes: {
          'MapPage': (context) => const ShowPage(),
          'BusPage': (context) => const Home(),
          'ListPage': (context) => const ListPage(),
        });
  }
}
