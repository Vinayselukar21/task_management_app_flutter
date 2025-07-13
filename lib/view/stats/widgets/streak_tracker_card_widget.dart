import 'package:flutter/material.dart';

class StreakTrackerCardWidget extends StatelessWidget {
  const StreakTrackerCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Streak Tracker",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.local_fire_department, color: Colors.orange, size: 34,),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("15 Days", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text("Current Streak", style: TextStyle(color: Colors.grey , fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.emoji_events_outlined, color: Colors.blue, size: 34,),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("30 Days", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text("Longest Streak", style: TextStyle(color: Colors.grey , fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
