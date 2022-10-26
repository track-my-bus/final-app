import 'package:json_annotation/json_annotation.dart';

import 'buss.dart';

part 'stops_model.g.dart';

@JsonSerializable()
class StopsModel {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'stopName')
  String? stopName;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'lng')
  String? lng;
  @JsonKey(name: 'busses')
  List<Buss> busses;
  @JsonKey(name: '__v')
  int? v;

  StopsModel({
    this.id,
    this.stopName,
    this.lat,
    this.lng,
    this.busses = const [],
    this.v,
  });

  factory StopsModel.fromJson(Map<String, dynamic> json) {
    return _$StopsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StopsModelToJson(this);
}
