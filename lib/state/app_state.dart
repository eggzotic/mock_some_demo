import 'package:flutter/material.dart';
import 'package:mock_some_demo/mocking/mock_some.dart';
import 'package:rest_api_client/implementations/rest_api_client.dart';
import 'package:rest_api_client/options/logging_options.dart';
import 'package:rest_api_client/options/rest_api_client_options.dart';

class AppState with ChangeNotifier {
  final _baseUrl = "https://restcountries.com";
  final _pathNz = "/v3.1/name/New%20Zealand?fields=tld";
  final _pathAu = "/v3.1/name/Australia?fields=tld";
  final _pathSg = "/v3.1/name/Singapore?fields=tld";

  late final RestApiClient _restApiClient;
  late final MockSome _mockSome;

  AppState() {
    _mockSome = MockSome(
        fromFile: "config.json",
        whenComplete: () async {
          await _initRestApiClient();
          _isready = true;
          notifyListeners();
        });
  }

  Future<void> _initRestApiClient() async {
    _restApiClient = RestApiClient(
      options: RestApiClientOptions(
        baseUrl: _baseUrl,
      ),
      loggingOptions: const LoggingOptions(
        logNetworkTraffic: false,
      ),
      interceptors: [_mockSome.interceptor],
    );
    await _restApiClient.init();
  }

  bool get isReady => _isready;
  bool _isready = false;

  Future<void> fetch() async {
    final responseNz = await _restApiClient.get(_pathNz);
    if (responseNz.isSuccess) {
      debugPrint("Response: ${responseNz.data}");
    } else {
      debugPrint("Error code: ${responseNz.exception}");
    }
    final responseAu = await _restApiClient.get(_pathAu);
    if (responseAu.isSuccess) {
      debugPrint("Response: ${responseAu.data}");
    } else {
      debugPrint("Error code: ${responseAu.statusCode}");
    }
    final responseSg = await _restApiClient.get(_pathSg);
    if (responseSg.isSuccess) {
      debugPrint("Response: ${responseSg.data}");
    } else {
      debugPrint("Error code: ${responseSg.statusCode}");
    }
    final respAu = await _restApiClient.authHandler.dio.get(_pathAu);
    if (respAu.statusCode == 200) {
      debugPrint("RLS dio response: ${respAu.data}");
    } else {
      debugPrint(
          "RLS dio error: ${respAu.statusCode}, ${respAu.statusMessage}");
    }
    final respNz = await _restApiClient.authHandler.dio.get(_pathNz);
    if (respNz.statusCode == 200) {
      debugPrint("RLS dio response: ${respNz.data}");
    } else {
      debugPrint(
          "RLS dio error: ${respNz.statusCode}, ${respNz.statusMessage}");
    }
  }
}
