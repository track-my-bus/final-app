// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_stops_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllStopsModel _$GetAllStopsModelFromJson(Map<String, dynamic> json) =>
    GetAllStopsModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => StopsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetAllStopsModelToJson(GetAllStopsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
