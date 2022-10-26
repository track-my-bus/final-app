import 'package:json_annotation/json_annotation.dart';

part 'buss.g.dart';

@JsonSerializable()
class Buss {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: '_id')
  String? id;

  Buss({this.name, this.id});

  factory Buss.fromJson(Map<String, dynamic> json) => _$BussFromJson(json);

  Map<String, dynamic> toJson() => _$BussToJson(this);
}
