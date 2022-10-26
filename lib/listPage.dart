import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/bus_model/bus_model.dart';
import 'data/data.dart';
import 'data/stops_model/stops_model.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

final List<StopsModel> _Stops = [];
BusModel stopsList = BusModel();

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // ignore: await_only_futures
      final data = await ModalRoute.of(context)?.settings.arguments as BusModel;
      final bus = data.bus;

      final stops = await getDB().getStopsList(bus!);
      print(data);

      _Stops.clear();
      _Stops.addAll(stops);
      // ignore: unnecessary_null_comparison
      if (stops[0] == null) {
        setState(() {
          _Stops.addAll(stops);
        });
      }
      // print("value is $values");
      // final data = await getDB().getAllData();
      stopsList = BusModel();
      stopsList = (data);
      // ignore: unnecessary_null_comparison
      if (mounted) {
        setState(() {
          stopsList = data;
        });
      }
    });
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
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
            children: List.generate(_Stops.length, (index) {
              final name = _Stops[index];
              return SizedBox(
                child: TextButton(
                  style: TextButton.styleFrom(
                      side: const BorderSide(
                    width: 0.01,
                  )),
                  onPressed: () {},
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(name.stopName!,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 17)),
                  ),
                ),
              );
            }),
          )),
    );
  }
}
