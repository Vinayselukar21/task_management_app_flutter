import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool _enableAllNotifications = true;
  bool _taskReminders = true;
  bool _dailySummary = true;
  bool _soundAlerts = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text('Notifications')),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Enable All Notifications",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    value: _enableAllNotifications,
                    onChanged: (bool value) {
                      setState(() {
                        _enableAllNotifications = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Task Reminders",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    value: _taskReminders,
                    onChanged: (bool value) {
                      setState(() {
                        _taskReminders = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Daily Summary",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    value: _dailySummary,
                    onChanged: (bool value) {
                      setState(() {
                        _dailySummary = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Sound Alerts",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    value: _soundAlerts,
                    onChanged: (bool value) {
                      setState(() {
                        _soundAlerts = value;
                      });
                    },
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
