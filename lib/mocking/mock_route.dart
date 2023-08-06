import 'package:json_annotation/json_annotation.dart';

part 'mock_route.g.dart';

@JsonSerializable()
class MockRoute {
  final String method;
  final String path;
  final int code;
  final Map<String, dynamic> data;

  MockRoute({
    required this.method,
    required this.code,
    required this.data,
    required this.path,
  });

  factory MockRoute.fromJson(Map<String, dynamic> json) =>
      _$MockRouteFromJson(json);

  Map<String, dynamic> toJson() => _$MockRouteToJson(this);
}
