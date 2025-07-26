import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_buddy_flutter/view/home/home_screen.dart';

class TaskDetailsScreen extends StatefulWidget {
  final Task task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                Text(widget.task.title, style: TextStyle(fontSize: 40)),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: widget.task.priority == 'High'
                    ? Colors.red.withAlpha(90)
                    : widget.task.priority == "Low"
                    ? Colors.green.withAlpha(90)
                    : Colors.yellow.withAlpha(90),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                '${widget.task.priority} Priority',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.task.priority == 'High'
                      ? Colors.red
                      : widget.task.priority == "Low"
                      ? Colors.green
                      : const Color.fromARGB(255, 192, 144, 0),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Description', style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(height: 8),
            Text(
              widget.task.description ?? "No description",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            Text('Due Date', style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(height: 8),
            Text(
              '${DateFormat('dd MMM yyyy').format(widget.task.dueDate)} at ${widget.task.time}',
            ),
            const SizedBox(height: 24),
            Text('Category', style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(height: 8),
            Text(widget.task.category),
            const SizedBox(height: 24),
            Text('Frequency', style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(height: 8),
            Text(widget.task.frequency),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Mark as Complete",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Delete Task",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
