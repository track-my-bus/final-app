import 'package:json_annotation/json_annotation.dart';

part 'bus_model.g.dart';

@JsonSerializable()
class BusModel {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'bus')
  String? bus;
  @JsonKey(name: 'startName')
  String? startName;
  @JsonKey(name: 'sLat')
  String? sLat;

  @JsonKey(name: 'sLng')
  String? sLng;

  @JsonKey(name: 'destName')
  String? destName;
  @JsonKey(name: 'dLat')
  String? dLat;
  @JsonKey(name: 'dLng')
  String? dLng;
  @JsonKey(name: '__v')
  int? v;

  BusModel({
    this.id,
    this.bus,
    this.startName,
    this.sLat,
    this.sLng,
    this.destName,
    this.dLat,
    this.dLng,
    this.v,
  });

  factory BusModel.fromJson(Map<String, dynamic> json) {
    return _$BusModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusModelToJson(this);
}
