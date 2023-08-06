import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mock_some_demo/mocking/mock_interceptor.dart';
import 'package:mock_some_demo/mocking/mock_route.dart';

/// {@template MockSomeSetup_doc}
/// Setup mocking, as defined in [fromFile], and insert as interceptors
/// in [dio]. On completion of the setup, [whenComplete] is called to signal
/// to the calling object that it's ready for use
/// {@endtemplate}
class MockSome {
  final String fromFile;
  late final MockInterceptor interceptor;

  /// {@macro MockSomeSetup_doc}
  MockSome({
    required this.fromFile,
    required void Function() whenComplete,
  }) {
    _loadMockingConfig().then((_) => whenComplete());
  }
  //
  Future<void> _loadMockingConfig() async {
    final routes = <String, MockRoute>{};
    try {
      final config = await rootBundle.loadString(fromFile);
      final Map<String, dynamic> jsonData = jsonDecode(config);
      if (jsonData.containsKey("mockRoutes")) {
        final pathsData = jsonData["mockRoutes"] as List;
        for (var json in pathsData) {
          try {
            final mockRoute = MockRoute.fromJson(json);
            routes.addAll({
              "${mockRoute.method}:${mockRoute.path}": mockRoute,
            });
          } catch (e) {
            debugPrint("Warning: could not deserialize mock path: $json");
          }
        }
      }
      interceptor = MockInterceptor(routes: routes);
    } catch (e) {
      debugPrint("Error: could not read $fromFile: $e");
    }
  }
}
