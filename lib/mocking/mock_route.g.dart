// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mock_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MockRoute _$MockRouteFromJson(Map<String, dynamic> json) => MockRoute(
      method: json['method'] as String,
      code: json['code'] as int,
      data: json['data'] as Map<String, dynamic>,
      path: json['path'] as String,
    );

Map<String, dynamic> _$MockRouteToJson(MockRoute instance) => <String, dynamic>{
      'method': instance.method,
      'path': instance.path,
      'code': instance.code,
      'data': instance.data,
    };
