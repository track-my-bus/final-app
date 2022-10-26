// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAll _$GetAllFromJson(Map<String, dynamic> json) => GetAll(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => BusModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetAllToJson(GetAll instance) => <String, dynamic>{
      'data': instance.data,
    };
