import 'package:flutter/material.dart';
import 'package:task_buddy_flutter/view/home/home_screen.dart';
import 'package:task_buddy_flutter/view/tasks/task_details_screen.dart';


class TaskList extends StatefulWidget {
  final List<Task> tasks;

  const TaskList({required this.tasks, super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.tasks.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final task = widget.tasks[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: task.isCompleted,
                activeColor: Colors.blue, // ✅ Color when checked
                checkColor: Colors.white, // ✅ Tick color
                side: BorderSide(
                  width: 1,
                  color: Colors.black,
                ), // ✅ Border when unchecked
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onChanged: (bool? newValue) {
                  setState(() {
                    task.isCompleted = newValue ?? false;
                  });
                },
              ),
              const SizedBox(width: 8),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (_) => TaskDetailsScreen(task: Task(title: task.title, description: task.description, time: task.time, category: task.category, priority: task.priority, frequency: task.frequency, dueDate: task.dueDate),)));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        task.time,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
