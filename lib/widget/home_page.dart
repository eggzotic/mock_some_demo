import 'package:flutter/material.dart';
import 'package:mock_some_demo/state/app_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mocking with REST API"),
      ),
      body: appState.isReady
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await appState.fetch();
                    },
                    child: const Text("Fetch"),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
