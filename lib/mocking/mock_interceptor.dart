import 'package:dio/dio.dart';
import 'package:mock_some_demo/mocking/mock_route.dart';

class MockInterceptor extends Interceptor {
  final Map<String, MockRoute> routes;

  MockInterceptor({required this.routes});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final routeKey = '${options.method}:${options.path}';
    if (routes.containsKey(routeKey)) {
      // mock response
      final response = Response(
        requestOptions: options,
        data: routes[routeKey]!.data,
        statusCode: routes[routeKey]!.code,
      );
      handler.resolve(response);
    } else {
      // or move on to fetching a real response
      handler.next(options);
    }
  }
}
