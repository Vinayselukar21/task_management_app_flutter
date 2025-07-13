import 'package:flutter/material.dart';

class StatsCardWidget extends StatelessWidget {
  const StatsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          _StatItem(
            icon: Icons.check_circle,
            iconColor: Colors.green,
            value: '124',
            label: 'Tasks Completed',
          ),
          _StatItem(
            icon: Icons.trending_up,
            iconColor: Colors.blue,
            value: '85%',
            label: 'On-Time Rate',
          ),
          _StatItem(
            icon: Icons.event_note,
            iconColor: Colors.orange,
            value: '7',
            label: 'Avg. Tasks/Day',
          ),
          _StatItem(
            icon: Icons.error_outline,
            iconColor: Colors.red,
            value: '3',
            label: 'Overdue Tasks',
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 34, color: iconColor),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
