import 'dart:convert';
import 'data/data.dart';

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: unused_import
import 'package:trackmybusapp/constant.dart';

import 'data/bus_model/bus_model.dart';
import 'data/stops_model/stops_model.dart';
import 'listPage.dart';
import 'data/get_location/get_location.dart';
import 'data/get_location/data.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({super.key, String? name, String? lat, String? long});

  @override
  State<ShowPage> createState() => _ShowPageState();
}

BusModel stopsList = BusModel();
List<LatLng> polylineCoordinates = [];
final List<StopsModel> _Stops = [];
Set<Marker> markers = new Set();
int _selectedIndex = 0;
String busName = '';
GetLocation _getLocation = GetLocation();

class _ShowPageState extends State<ShowPage> {
  final Completer<GoogleMapController> _controller = Completer();

//Path lines

  // void getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();

  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     google_api_key,
  //     const PointLatLng(9.0671851, 76.5343456),
  //     const PointLatLng(9.172101, 76.4978305),
  //   );

  //   if (result.points.isNotEmpty) {
  //     for (var point in result.points) {
  //       {
  //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //       }
  //     }
  //     print('got all the points');
  //     setState(() {});
  //   } else {
  //     print('didnt get the coordinates');
  //   }
  // }

  // @override
  // void initState() {
  //   getPolyPoints();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      GoogleMapController googleMapController = await _controller.future;

      // ignore: await_only_futures
      final data = await ModalRoute.of(context)?.settings.arguments as BusModel;
      final bus = data.bus;

      final stops = await getDB().getStopsList(bus!);
      busName = bus;
      _Stops.clear();
      _Stops.addAll(stops);
      if (stops[0] == null) {
        setState(() {
          _Stops.addAll(stops);
        });
      }

//bus Location

      Timer.periodic(const Duration(seconds: 2), (timer) {
        setState(() async {
          var location = await getDB().getLocation(bus);

          _getLocation = (location);
          var lat = _getLocation.data?.lat ?? '0';
          var lng = _getLocation.data?.lng ?? '0';
          LatLng busLocation = LatLng(double.parse(lat), double.parse(lng));
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: busLocation)));
        });
      });

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
    markers.clear();
    for (int i = 0; i < _Stops.length; i++) {
      var lat = _Stops[i].lat ?? '0';
      var lng = _Stops[i].lng ?? '0';
      polylineCoordinates.add(LatLng(double.parse(lat), double.parse(lng)));
      markers.add(Marker(
          markerId: MarkerId(i.toString()),
          position: LatLng(double.parse(lat), double.parse(lng)),
          infoWindow: InfoWindow(
            title: _Stops[i].stopName,
          )));
    }
    final lat1 = stopsList.sLat ?? '0';
    final lat2 = stopsList.dLat ?? '0';
    final lon1 = stopsList.sLng ?? '0';
    final lon2 = stopsList.dLng ?? '0';
    final bus = stopsList.bus ?? '0';
    var lat = _getLocation.data?.lat ?? '0';
    var lng = _getLocation.data?.lng ?? '0';

    LatLng sourceLocation = LatLng(double.parse(lat1), double.parse(lon1));
    LatLng destinationLocation = LatLng(double.parse(lat2), double.parse(lon2));
    LatLng busLocation = LatLng(double.parse(lat), double.parse(lng));
    if (stopsList.sLat == null && _getLocation == null) {
      return const Scaffold(
        body: Text('Waiting ..'),
      );
    } else {
      markers.add(Marker(
        markerId: MarkerId(busLocation.toString()),
        position: busLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(
          title: _getLocation.data?.bus,
        ),
      ));

      // ignore: no_leading_underscores_for_local_identifiers
      void _onItemTapped(int index) {
        setState(() {
          _selectedIndex = index;
        });
      }

      List<Widget> pages = [
        GoogleMap(
          initialCameraPosition:
              CameraPosition(target: busLocation, zoom: 14.5),
          // polylines: {
          //   Polyline(
          //     polylineId: const PolylineId('route'),
          //     points: polylineCoordinates,
          //   )
          // },
          markers: markers,
          onMapCreated: (mapController) {
            _controller.complete(mapController);
          },
          trafficEnabled: true,
          scrollGesturesEnabled: true,
          myLocationEnabled: true,
          minMaxZoomPreference: const MinMaxZoomPreference(12, 14),
        ),
        const ListPage(),
      ];

      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            leading: const BackButton(
              color: Colors.black, // <-- SEE HERE
            ),
            title: Text(bus, style: const TextStyle(color: Colors.black)),
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: pages.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'List',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
          ));
    }
  }
}
