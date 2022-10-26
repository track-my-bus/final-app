// ignore: file_names

import 'package:flutter/material.dart';
import 'package:trackmybusapp/showPage.dart';

import 'data/data.dart';
import 'data/bus_model/bus_model.dart';
import 'data/stops_model/buss.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final List<Buss> BusList = [];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final data1 = ModalRoute.of(context)?.settings.arguments as List<Buss>;

      BusList.clear();
      BusList.addAll(data1);
      setState(() {
        BusList.addAll(data1);
      });
    });

    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          title: const Text("Available Busses",
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
            height: 600,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.center,
                  image: const AssetImage("lib/asset/icon.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.1), BlendMode.dstATop)),
            ),
            child: GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 8,
              children: List.generate(BusList.length ~/ 2, (index) {
                final bus = BusList[index];
                final name = bus.name;
                return TextButton(
                    onPressed: () async {
                      final data = await getDB().getAllData(name);
                      // ignore: use_build_context_synchronously
                      // Navigator.of(context)
                      //     .pushNamed("ListPage", arguments: data[0]);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context)
                          .pushNamed("MapPage", arguments: data[0]);
                      // ignore: use_build_context_synchronously
                    },
                    style: TextButton.styleFrom(
                      side: const BorderSide(
                        width: 0.01,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(name!,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 17)),
                    ));
              }),
            )));
  }
}
