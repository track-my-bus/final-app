// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['_id'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      bus: json['bus'] as String?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      '_id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'bus': instance.bus,
      '__v': instance.v,
    };
