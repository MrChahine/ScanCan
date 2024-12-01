import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<dynamic>? outputs;

  const ResultScreen({super.key, this.outputs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analysis Result")),
      body: outputs != null
          ? ListView.builder(
              itemCount: outputs!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(outputs![index]["label"]),
                  subtitle: Text(
                      "Confidence: ${(outputs![index]["confidence"] * 100).toStringAsFixed(2)}%"),
                );
              },
            )
          : const Center(
              child: Text("No results available."),
            ),
    );
  }
}
