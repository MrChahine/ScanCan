import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Section
                Text(
                  "Welcome to SkinScan: Your Partner in Skin Health",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                // Why Skin Health Matters Section
                Text(
                  "Why Skin Health Matters",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Your skin is the body's largest organ, and it plays a crucial role in protecting you from harmful UV radiation, infections, and other environmental factors. However, like any other organ, your skin is vulnerable to diseases, and one of the most serious threats is skin cancer. Skin cancer is the most common type of cancer, affecting millions of people worldwide every year. Early detection is key to successful treatment and prevention.",
                ),
                SizedBox(height: 20),

                // Importance of Skin Analysis Section
                Text(
                  "The Importance of Skin Analysis",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Regular skin checks are essential for identifying early signs of skin cancer. While some changes in your skin may be harmless, others can signal potential skin cancer, including melanoma, basal cell carcinoma, and squamous cell carcinoma.",
                ),
                SizedBox(height: 20),

                // Common Signs of Skin Cancer Section
                Text(
                  "What to Look For: Common Signs of Skin Cancer",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "- New Moles or Growths: Unusual growths or new moles that appear on your skin.\n"
                  "- Changes in Existing Moles: If a mole changes in size, shape, or color, it could be a warning sign.\n"
                  "- Itching or Bleeding: If a mole becomes itchy, painful, or begins to bleed, it's important to get it checked.\n"
                  "- Uneven Borders: Moles with irregular borders, such as jagged or notched edges, may be concerning.\n"
                  "- Color Variations: Moles with multiple colors or uneven pigmentation could be a sign of skin cancer.",
                ),
                SizedBox(height: 20),

                // Why Early Detection Saves Lives Section
                Text(
                  "Why Early Detection Saves Lives",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Detecting skin cancer early significantly improves the chances of successful treatment. The earlier a skin cancer is found, the easier it is to treat, and the lower the risk of it spreading to other parts of the body. Regular skin checks and timely medical consultations are your best defense.",
                ),
                SizedBox(height: 20),

                // How SkinScan Helps Section
                Text(
                  "How SkinScan Helps You",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "SkinScan empowers you to monitor your skin health from the comfort of your home. By analyzing photos of your skin, SkinScan helps identify potential signs of skin cancer, alerting you to abnormalities that require attention. Our advanced machine learning algorithms, powered by TensorFlow Lite, make it easy for you to get insights into your skin's health.",
                ),
                SizedBox(height: 20),

                // Call to Action Section
                Text(
                  "Take Charge of Your Skin Health",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Make skin self-exams a part of your regular routine. With SkinScan, you can take an active role in your health, catching potential problems early and seeking medical advice when needed.",
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
