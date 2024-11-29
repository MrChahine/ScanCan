import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scancan/Pages/Welcome.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image; // To store the captured image
  bool _isLoading = true; // Track loading state

  // Method to capture an image using the camera
  Future<void> _takePhoto() async {
    setState(() {
      _isLoading = true; // Set loading state to true
    });

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the image state
      });
    }

    setState(() {
      _isLoading = false; // Camera loading completed
    });
  }

  @override
  void initState() {
    super.initState();
    _takePhoto(); // Automatically trigger the camera when the screen opens
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera Screen")),
      body: _isLoading
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
                              // Proceed to analysis
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WelcomePage(),
                                ),
                              );
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
