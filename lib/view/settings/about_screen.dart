import 'package:flutter/material.dart';
import 'package:task_buddy_flutter/view/settings/contact_us_screen.dart';
import 'package:task_buddy_flutter/view/settings/privacy_policy_screen.dart';
import 'package:task_buddy_flutter/view/settings/terms_of_service_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About TaskBuddy'), centerTitle: true),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/profile.png',
                width: 100, // square size
                height: 100,
                fit:
                    BoxFit.cover, // makes it fill the square without distortion
              ),
            ),
            SizedBox(height: 12),
            Text(
              'TaskBuddy',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 12),
            Text('Version 1.0.0', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 24),
            Text(
              'TaskBuddy is your ultimate personal task and productivity tracking companion. Designed with a modern, clean, and user-friendly interface, it helps you manage your daily tasks, track progress, and boost your productivity effortlessly.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicyScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.lock, color: Colors.black, size: 24),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_right,
                            color: Colors.black,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsOfServiceScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.description,
                            color: Colors.black,
                            size: 24,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "Terms of Service",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_right,
                            color: Colors.black,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactUsScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.mail, color: Colors.black, size: 24),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "Contact Us",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_right,
                            color: Colors.black,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
