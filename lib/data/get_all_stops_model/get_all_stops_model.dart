import 'package:json_annotation/json_annotation.dart';
import 'package:trackmybusapp/data/stops_model/stops_model.dart';

part 'get_all_stops_model.g.dart';

@JsonSerializable()
class GetAllStopsModel {
  @JsonKey(name: 'data')
  List<StopsModel> data;

  GetAllStopsModel({this.data = const []});

  factory GetAllStopsModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllStopsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllStopsModelToJson(this);
}
