import 'package:trackmybusapp/data/bus_model/bus_model.dart';
import 'package:dio/dio.dart';
import 'package:trackmybusapp/data/stops_model/stops_model.dart';

import 'Urls.dart';
import 'get_all/get_all.dart';
import 'get_all_stops_model/get_all_stops_model.dart';
import 'get_location/get_location.dart';

final dio = Dio();
final url = Urls();

abstract class Apicalls {
  Future<List<BusModel>> getAllData(String bus);
  Future<List<StopsModel>> getStopsData();
  Future<List<StopsModel>> getStopsList(String bus);
  Future<GetLocation> getLocation(String bus);
}

// ignore: camel_case_types
class getDB extends Apicalls {
  @override
  Future<List<BusModel>> getAllData(String bus) async {
    final result =
        await dio.post((url.baseUrl + url.getBusData), data: {"bus": bus});
    result.data.toString();
    if (result.data != null) {
      final value = GetAll.fromJson(result.data);

      return value.data;
    }
    return [];
  }

  @override
  Future<List<StopsModel>> getStopsData() async {
    final result = await dio.get(url.baseUrl + url.getStopsData);
    result.data.toString();
    if (result.data != null) {
      final value = GetAllStopsModel.fromJson(result.data);
      return value.data;
    } else {
      return [];
    }
  }

  @override
  Future<List<StopsModel>> getStopsList(String bus) async {
    final result =
        await dio.post((url.baseUrl + url.getStopsList), data: {"bus": bus});

    result.data.toString();
    if (result.data != null) {
      final value = GetAllStopsModel.fromJson(result.data);
      return value.data;
    } else {
      return [];
    }
  }

  @override
  Future<GetLocation> getLocation(String bus) async {
    final result =
        await dio.post((url.baseUrl + url.getLocation), data: {"bus": bus});
    result.data.toString();
    if (result.data != null) {
      final value = GetLocation.fromJson(result.data);
      return value;
    } else {
      return null as GetLocation;
    }
  }
}
