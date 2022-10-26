import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_location.g.dart';

@JsonSerializable()
class GetLocation {
  @JsonKey(name: "data")
  Data? data;

  GetLocation({this.data = null});

  factory GetLocation.fromJson(Map<String, dynamic> json) {
    return _$GetLocationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetLocationToJson(this);
}
