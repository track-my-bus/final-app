import 'package:json_annotation/json_annotation.dart';
import 'package:trackmybusapp/data/bus_model/bus_model.dart';

part 'get_all.g.dart';

@JsonSerializable()
class GetAll {
  @JsonKey(name: 'data')
  List<BusModel> data;

  GetAll({this.data = const []});

  factory GetAll.fromJson(Map<String, dynamic> json) {
    return _$GetAllFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllToJson(this);
}
