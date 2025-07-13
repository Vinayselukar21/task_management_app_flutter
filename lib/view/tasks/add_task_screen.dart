import 'package:flutter/material.dart';
import 'package:task_buddy_flutter/view/home/home_screen.dart';
import 'package:task_buddy_flutter/view/layout/main_layout.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _addTaskForm = GlobalKey<FormState>();
  final _taskTitleController = TextEditingController();
  final _taskDescriptionController = TextEditingController();
  final _taskDueDateController = TextEditingController();
  DateTime? _selectedDate;

  final _taskTimeController = TextEditingController();
  TimeOfDay? _selectedTime;

  String? _taskCategoryController;
  String? _taskPriorityController;
  String? _taskFrequencyController;

  final List<String> _categoryOptions = ['Work', 'Personal', 'Study'];
  final List<String> _priorityOptions = ['Low', 'Medium', 'High'];
  final List<String> _frequencyOptions = ['Never','One-time', 'Daily', 'Weekly'];

  bool _reminder = false;

  void _saveTask() {
    // save task logic here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainLayout()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Add New Task'),
        actions: [
          TextButton(
            onPressed: _saveTask,
            child: Text(
              'Save',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Form(
              key: _addTaskForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  Text('Task Title'),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _taskTitleController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'eg., Finish project report',
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text('Description (Optional)'),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _taskDescriptionController,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Add more details about the task',
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text('Due Date'),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _taskDueDateController,
                      decoration: InputDecoration(
                        labelText: 'Due Date',
                        suffixIcon: Icon(Icons.calendar_today),
                        border: InputBorder.none,
                      ),
                      readOnly: true,
                      onTap: () async {
                        FocusScope.of(
                          context,
                        ).requestFocus(FocusNode()); // prevent keyboard

                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate = pickedDate;
                            _taskDueDateController.text =
                                "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                          });
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your date of birth';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  Text('Time'),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _taskTimeController,
                      decoration: InputDecoration(
                        labelText: 'Select Time',
                        suffixIcon: Icon(Icons.access_time),
                        border: InputBorder.none,
                      ),
                      readOnly: true,
                      onTap: () async {
                        FocusScope.of(
                          context,
                        ).requestFocus(FocusNode()); // to prevent keyboard

                        final TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (pickedTime != null) {
                          setState(() {
                            _selectedTime = pickedTime;
                            final now = DateTime.now();
                            final formattedTime = TimeOfDay(
                              hour: pickedTime.hour,
                              minute: pickedTime.minute,
                            ).format(context);
                            _taskTimeController.text = formattedTime;
                          });
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select time';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  Text('Category'),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButtonFormField<String>(
                      value: _taskCategoryController,
                      decoration: InputDecoration(
                        labelText: 'Select Option',
                        border: InputBorder.none,
                      ),
                      items: _categoryOptions.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _taskCategoryController = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  Text('Priority'),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButtonFormField<String>(
                      value: _taskPriorityController,
                      decoration: InputDecoration(
                        labelText: 'Select Option',
                        border: InputBorder.none,
                      ),
                      items: _priorityOptions.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _taskCategoryController = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  Text('Repeat Frequency'),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButtonFormField<String>(
                      value: _taskFrequencyController,
                      decoration: InputDecoration(
                        labelText: 'Select Option',
                        border: InputBorder.none,
                      ),
                      items: _frequencyOptions.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _taskCategoryController = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  SwitchListTile(
                    title: Text('Reminder'),
                    value: _reminder,
                    onChanged: (bool value) {
                      setState(() {
                        _reminder = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
