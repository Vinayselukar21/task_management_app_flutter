import 'package:flutter/material.dart';
import 'package:task_buddy_flutter/view/home/widgets/task_widget.dart';
import 'package:task_buddy_flutter/view/tasks/add_task_screen.dart';

class Task {
  final String title;
  final String? description;
  final String time; // time of creation or scheduled time
  final String category;
  final String priority; // e.g. 'High', 'Medium', 'Low'
  final String frequency; // e.g. 'Daily', 'Weekly', 'One-time'
  final DateTime dueDate;
  bool isCompleted;

  Task({
    required this.title,
    this.description,
    required this.time,
    required this.category,
    required this.priority,
    required this.frequency,
    required this.dueDate,
    this.isCompleted = false,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Good morning, John!'),
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/profile.png',
              ), // replace with your image
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 130,
                child: GridView.count(
                  crossAxisCount: 3, // number of columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.all(0),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Tasks',
                            style: const TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '12',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Completed',
                            style: const TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '8',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Productivity Score',
                            style: const TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '85%',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TabBar(
                          dividerHeight: 0,
                          indicator: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          indicatorSize: TabBarIndicatorSize
                              .tab, // ✅ makes the highlight fit the entire tab
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          tabs: const [
                            Tab(text: 'Today'),
                            Tab(text: 'Upcoming'),
                            Tab(text: 'Completed'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Tab views
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Today Tasks
                            TaskList(
                              tasks: [
                                Task(
                                  title: 'Finish Banani UI',
                                  description:
                                      'Complete the frontend for Banani screen.',
                                  time: '9:00 AM',
                                  category: 'Work',
                                  priority: 'High',
                                  frequency: 'One-time',
                                  dueDate: DateTime(2025, 7, 13),
                                  isCompleted: false,
                                ),
                                Task(
                                  title: 'Team Meeting',
                                  description:
                                      'Sprint planning with the entire team.',
                                  time: '10:30 AM',
                                  category: 'Meetings',
                                  priority: 'Medium',
                                  frequency: 'Weekly',
                                  dueDate: DateTime(2025, 7, 13),
                                  isCompleted: false,
                                ),
                                Task(
                                  title: 'Review Project Proposal',
                                  description:
                                      'Review and provide feedback on the proposal.',
                                  time: '2:00 PM',
                                  category: 'Work',
                                  priority: 'High',
                                  frequency: 'One-time',
                                  dueDate: DateTime(2025, 7, 13),
                                  isCompleted: false,
                                ),
                                Task(
                                  title: 'Workout',
                                  description: 'Evening gym session.',
                                  time: '6:00 PM',
                                  category: 'Personal',
                                  priority: 'Low',
                                  frequency: 'Daily',
                                  dueDate: DateTime(2025, 7, 13),
                                  isCompleted: false,
                                ),
                              ],
                            ),

                            TaskList(
                              tasks: [
                                Task(
                                  title: 'Client Call',
                                  description:
                                      'Call with client for feedback and clarification.',
                                  time: '10:00 AM',
                                  category: 'Meetings',
                                  priority: 'High',
                                  frequency: 'One-time',
                                  dueDate: DateTime(2025, 7, 14),
                                  isCompleted: false,
                                ),
                                Task(
                                  title: 'Design Review',
                                  description:
                                      'UI/UX review of the new dashboard designs.',
                                  time: '3:00 PM',
                                  category: 'Design',
                                  priority: 'Medium',
                                  frequency: 'One-time',
                                  dueDate: DateTime(2025, 7, 14),
                                  isCompleted: false,
                                ),
                              ],
                            ),

                            TaskList(
                              tasks: [
                                Task(
                                  title: 'Completed Task 1',
                                  description: 'Old task marked as done.',
                                  time: 'Yesterday',
                                  category: 'Work',
                                  priority: 'Medium',
                                  frequency: 'One-time',
                                  dueDate: DateTime(2025, 7, 12),
                                  isCompleted: true,
                                ),
                                Task(
                                  title: 'Completed Task 2',
                                  description: 'Archived completed task.',
                                  time: '2 days ago',
                                  category: 'Work',
                                  priority: 'Low',
                                  frequency: 'One-time',
                                  dueDate: DateTime(2025, 7, 11),
                                  isCompleted: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
