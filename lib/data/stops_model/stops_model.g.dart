// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stops_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StopsModel _$StopsModelFromJson(Map<String, dynamic> json) => StopsModel(
      id: json['_id'] as String?,
      stopName: json['stopName'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      busses: (json['busses'] as List<dynamic>?)
              ?.map((e) => Buss.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$StopsModelToJson(StopsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'stopName': instance.stopName,
      'lat': instance.lat,
      'lng': instance.lng,
      'busses': instance.busses,
      '__v': instance.v,
    };
