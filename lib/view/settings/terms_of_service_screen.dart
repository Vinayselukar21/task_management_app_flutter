import 'package:flutter/material.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  final List<Map<String, String>> termsOfServiceList = const [
    {
      'title': '1. Use of the App',
      'description':
          'TaskBuddy is designed to help you manage your personal tasks and improve productivity. You agree to use the App only for lawful purposes and in accordance with these Terms. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.',
    },
    {
      'title': '2. User Content',
      'description':
          'You retain all rights in, and are solely responsible for, the content you create, upload, post, or store on or through the App. By posting User Content, you grant TaskBuddy a worldwide, non-exclusive, royalty-free license to use, reproduce, modify, publish, and distribute your User Content in connection with the App\'s operation.',
    },
    {
      'title': '3. Prohibited Conduct',
      'description':
          'You agree not to engage in any of the following prohibited activities: (a) copying, distributing, or disclosing any part of the App in any medium; (b) using any automated system, including "robots", "spiders", etc., to access the App; (c) transmitting spam or other unsolicited email; (d) attempting to interfere with the system\'s integrity or security; (e) taking any action that imposes a large load on our infrastructure; (f) uploading invalid data or viruses; (g) collecting personally identifiable info; (h) impersonation or misrepresentation; (i) interfering with the App\'s proper working; (j) bypassing any security measures.',
    },
    {
      'title': '4. Intellectual Property',
      'description':
          'All intellectual property rights in the App and its content (excluding User Content) are owned by TaskBuddy or its licensors. You may not use any of TaskBuddy\'s trademarks, logos, or proprietary graphics without our prior written consent.',
    },
    {
      'title': '5. Disclaimers',
      'description':
          'The App is provided on an "as is" and "as available" basis. TaskBuddy makes no warranties regarding the App\'s operation, availability, accuracy, or reliability.',
    },
    {
      'title': '6. Limitation of Liability',
      'description':
          'To the maximum extent permitted by law, TaskBuddy shall not be liable for any indirect, incidental, special, or consequential damages, or loss of data, use, goodwill, or other intangible losses resulting from your access or use of the App, conduct of any third party, or unauthorized access or use of your transmissions or content.',
    },
    {
      'title': '7. Changes to Terms',
      'description':
          'We may revise these Terms from time to time. The most current version will always be posted on our website. By continuing to access or use the App after revisions become effective, you agree to be bound by the revised Terms.',
    },
    {
      'title': '8. Governing Law',
      'description':
          'These Terms shall be governed by the laws of the jurisdiction where TaskBuddy is headquartered, without regard to conflict of law provisions.',
    },
    {
      'title': '9. Contact Us',
      'description':
          'If you have any questions about these Terms, please contact us at support@taskbuddy.com.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terms of Service'), centerTitle: true),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to TaskBuddy!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 12),
              Text(
                'These Terms of Service ("Terms") govern your access to and use of the TaskBuddy mobile application (the "App"). By accessing or using the App, you agree to be bound by these Terms and our Privacy Policy, If you do not agree to these Terms, please do not use the App.',
              ),
              SizedBox(height: 12),
              Column(
                children: [
                  ...termsOfServiceList.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          item['title']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(item['description']!),
                      ),
                    );
                  }),
                ],
              ),
              SizedBox(height: 12),
              Text('Last updated: October 26, 2023'),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
