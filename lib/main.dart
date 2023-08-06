import 'package:flutter/material.dart';
import 'package:mock_some_demo/state/app_state.dart';
import 'package:mock_some_demo/widget/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const MockSomeDemo(),
    ),
  );
}

class MockSomeDemo extends StatelessWidget {
  const MockSomeDemo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}
