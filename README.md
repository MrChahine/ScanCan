# ScanCan - Skin Cancer Detection App

A Flutter-based mobile application that enables users to upload or capture skin photos and detects potential skin cancer using a TensorFlow Lite machine learning model. This app features user authentication, a history log of past analyses, and an intuitive user interface.

## Features
- **Login/Signup Interface**: Secure user authentication system.
- **Skin Photo Detection**: Analyze photos using a pre-trained TensorFlow Lite model.
- **Photo Upload Options**: Capture photos using the device camera or upload from local files.
- **History Log**: Track and manage previous analyses for each user.

## Installation

### Prerequisites
- [Flutter](https://docs.flutter.dev/get-started/install) installed on your machine.
- Dart SDK.
- Compatible IDE (e.g., Android Studio, VS Code).

### Steps to Run
1. Clone this repository:
   ```bash
   git clone https://github.com/MrChahine/ScanCan.git
   cd ScanCan
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Connect a physical device or start an emulator.
4. Run the app:
   ```bash
   flutter run
   ```
## TensorFlow Lite Integration
To use the TensorFlow Lite model for skin cancer detection:
1. Convert your trained TensorFlow model to TFLite format.
2. Add the `.tflite` file to your `assets` folder.
3. Update `pubspec.yaml` to include the model:
   ```yaml
   flutter:
     assets:
       - assets/skin_cancer_model.tflite
   ```
4. Use the `tflite` package to load and run the model in the app.

## Future Enhancements
- Add multi-language support.
- Integrate real-time analysis with camera feed.
- Improve the machine learning model for higher accuracy.

## Contributing
We welcome contributions! To contribute:
1. Fork the repository.
2. Create a feature branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add your message here"
   ```
4. Push to the branch:
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a pull request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact
For any questions or feedback:
- GitHub: [MrChahine](https://github.com/MrChahine)
