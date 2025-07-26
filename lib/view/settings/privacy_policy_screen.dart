import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Your privacy is important to us. This Privacy Policy explains how TaskBuddy collects, uses, and discloses information about you when you use our mobile application.\n",
              ),
              Text(
                "Information We Collect",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "We collect information you provide directly to us, such as when you create an account, create tasks, or communicate with us. This may include your name, email address, task details, and any other information you choose to provide.\n",
              ),
              Text(
                "How We Use Your Information",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "We use the information we collect to provide, maintain, and improve our services, such as to manage your tasks, personalize your experience, and send you notifications. We may also use the information to communicate with you about updates, security alerts, and support messages.\n",
              ),
              Text(
                "Information Sharing",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "We do not share your personal information with third parties except as described in this policy. We may share information with service providers who perform services on our behalf, such as hosting and analytics. We may also disclose information if required by law or in response to a legal process.\n",
              ),
              Text(
                "Data Security",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "We implement reasonable security measures to protect your information from unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet or electronic storage is 100% secure.\n",
              ),
              Text(
                "Your Choices",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "You may review, update, or delete your account information at any time through the app settings. You can also opt-out of receiving promotional communications from us by following the instructions in those communications.\n",
              ),
              Text(
                "Changes to This Policy",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the 'Last Updated' date. You are advised to review this Privacy Policy periodically for any changes.\n",
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Last Updated: October 26, 2023",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
