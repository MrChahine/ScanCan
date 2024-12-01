import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scancan/Pages/Result.dart';
import 'package:tflite_v2/tflite_v2.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image; // To store the captured image
  bool _loading = true; // Track loading state
  List? _outputs;

  // Method to capture an image using the camera
  Future<void> _takePhoto() async {
    setState(() {
      _loading = true; // Set loading state to true
    });

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the image state
      });
    }

    setState(() {
      _loading = false; // Camera loading completed
    });
  }

  @override
  void initState() {
    super.initState();
    _takePhoto();
    _loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  Future<void> _loadModel() async {
    String? result = await Tflite.loadModel(
      model: "assets/models/model.tflite",
      labels: "assets/models/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    print("Model Loaded: $result");
  }

  classifyImage(File image) async {
    setState(() {
      _loading = true; // Indicate loading state
    });

    try {
      var output = await Tflite.runModelOnImage(
          path: image.path,
          imageMean: 0.0, // Model-specific normalization mean
          imageStd: 255.0, // Model-specific normalization std
          numResults: 2, // Limit the number of results
          threshold: 0.2, // Confidence threshold
          asynch: true // Run asynchronously for better performance
          );

      setState(() {
        _loading = false; // End loading state
        _outputs = output; // Save results to a state variable
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(outputs: _outputs),
        ),
      );
    } catch (e) {
      setState(() {
        _loading = false;
        _outputs = []; // Handle errors by resetting outputs
      });
      print("Error running model: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera Screen")),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(), // Show loading indicator
            )
          : _image != null
              ? SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.file(_image!), // Display the captured image
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.grey[400]),
                              padding: WidgetStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 5)),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(27))),
                            ),
                            onPressed: () {
                              _takePhoto(); // Retake the photo by reopening the camera
                            },
                            child: const Text(
                              "Retake",
                              style: TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(180, 0, 0, 0),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.grey[400]),
                              padding: WidgetStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 5)),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(27))),
                            ),
                            onPressed: () {
                              classifyImage(_image!);
                            },
                            child: const Text(
                              "Analyze",
                              style: TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(180, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text("No image captured."),
                ),
    );
  }
}
