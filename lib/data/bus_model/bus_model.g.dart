// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusModel _$BusModelFromJson(Map<String, dynamic> json) => BusModel(
      id: json['_id'] as String?,
      bus: json['bus'] as String?,
      startName: json['startName'] as String?,
      sLat: json['sLat'] as String?,
      sLng: json['sLng'] as String?,
      destName: json['destName'] as String?,
      dLat: json['dLat'] as String?,
      dLng: json['dLng'] as String?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$BusModelToJson(BusModel instance) => <String, dynamic>{
      '_id': instance.id,
      'bus': instance.bus,
      'startName': instance.startName,
      'sLat': instance.sLat,
      'sLng': instance.sLng,
      'destName': instance.destName,
      'dLat': instance.dLat,
      'dLng': instance.dLng,
      '__v': instance.v,
    };
