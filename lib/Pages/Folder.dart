import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({super.key});

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  File? _image; // To store the captured image
  bool _loading = true; // Track loading state
  String _label = ''; // Store prediction label
  double _confidence = 0.0; // Store prediction confidence
  bool _isModelLoaded = false;

  // Load the TFLite model
  Future<void> _loadModel() async {
    if (_isModelLoaded) {
      print("Model is already loaded, no need to reload.");
      return;
    }

    String? result = await Tflite.loadModel(
      model: "assets/models/model3.tflite",
      labels: "assets/models/labels3.txt",
      numThreads: 1, // Single-threaded execution
      isAsset: true, // Model is in assets
      useGpuDelegate: false, // GPU acceleration off
    );

    if (result == "success") {
      _isModelLoaded = true; // Set the flag to true on successful load
    }
    print("Model Loaded: $result");
  }

  // Run the model on a given image
  Future<void> _classifyImage(File image) async {
    setState(() {
      _loading = true;
    });

    try {
      var recognitions = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0, // Normalization mean
        imageStd: 255.0, // Normalization std
        numResults: 2, // Max results
        threshold: 0.2, // Confidence threshold
        asynch: true,
      );

      if (recognitions != null && recognitions.isNotEmpty) {
        setState(() {
          _label = recognitions[0]['label'] ?? '';
          _confidence = (recognitions[0]['confidence'] ?? 0.0) * 100;
        });
      } else {
        setState(() {
          _label = 'No prediction';
          _confidence = 0.0;
        });
      }
    } catch (e) {
      print("Error during classification: $e");
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  // Capture image using the camera
  Future<void> _takePhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      await _classifyImage(File(pickedFile.path));
    }
  }

  @override
  void initState() {
    super.initState();
    _loadModel().then((_) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  void dispose() {
    Tflite.close(); // Close TFLite when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _image == null
                    ? ElevatedButton(
                        onPressed: _takePhoto,
                        child: const Text("Import Image"),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (_image != null)
                              Container(
                                constraints: const BoxConstraints(
                                    maxWidth: 350), // Adjust width as necessary
                                child: Image.file(_image!, height: 300),
                              ),
                            const SizedBox(height: 20),
                            Text(
                              "Prediction: $_label",
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              "Confidence: ${_confidence.toStringAsFixed(2)}%",
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _takePhoto,
                              child: const Text("Retake Photo"),
                            ),
                          ],
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
