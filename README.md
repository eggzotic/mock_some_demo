# mock_some_demo

Mock some - selective mocking to allow an in-dev app to use both real
web-endpoints and mocking where necessary. The AppState class demonstrates how
to do this with both direct Dio and also the rest_api_client class.

## Getting Started

To run:
```flutter run -d chrome```

Click the Fetch button and view the output in the console. Use the config.json
to specify which routes to mock. Anything not provided with explicit mock
responses in config.json will instead attempt to contact the real endpoint.
Useful when some endpoints may not exist yet.
