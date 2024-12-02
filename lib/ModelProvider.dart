/*import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ModelProvider with ChangeNotifier {
  bool _isModelLoaded = false;

  bool get isModelLoaded => _isModelLoaded;

  Future<void> loadModel() async {
    if (!_isModelLoaded) {
      String? result = await Tflite.loadModel(
        model: "assets/models/model.tflite",
        labels: "assets/models/labels.txt",
        numThreads: 1,
      );
      print("Model Loaded: $result");
      _isModelLoaded = true;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  Future<List<dynamic>?> classifyImage(String imagePath) async {
    return await Tflite.runModelOnImage(
      path: imagePath,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );
  }
}
*/