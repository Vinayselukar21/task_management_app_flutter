import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<String> _selectedEvents = [];

  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2025, 7, 14): [
      'Prepare Q4 Budget | 10:00 AM | Review department expenses and allocate funds for next quarter.',
      'Team Standup Meeting | 11:30 AM | Discuss progress on current sprints and blockers.',
      'Client Presentation Prep | 02:00 PM | Finalize slides and talking points for tomorrow\'s client meeting.',
    ],
    DateTime.utc(2025, 7, 3): [
      'Project Kickoff | 09:00 AM | Initial meeting with the new project team.',
    ],
    DateTime.utc(2025, 7, 7): [
      'Design Review | 01:00 PM | Go over UI/UX mockups with designers.',
      'Lunch with Sarah | 12:30 PM | Catch up at the cafe.',
    ],
    DateTime.utc(2025, 7, 18): [
      'Sprint Planning | 10:00 AM | Plan tasks for the next sprint.',
    ],
    DateTime.utc(2025, 7, 22): [
      'Marketing Sync | 03:00 PM | Discuss Q3 campaign strategies.',
    ],
    DateTime.utc(2025, 7, 25): [
      'Release v2.1 | 05:00 PM | Deploy new version to production.',
      'Team Dinner | 07:00 PM | Celebrate project milestone.',
    ],
    DateTime.utc(2025, 7, 29): [
      'Performance Review | 11:00 AM | Annual review with manager.',
    ],
    DateTime.utc(2025, 11, 13): ['One event here'],
    DateTime.utc(2025, 11, 21): [
      'Doctor Appointment | 4:00 PM | Regular checkup',
    ],
  };

  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = _getEventsForDay(_selectedDay!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calendar"), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                      _selectedEvents = _getEventsForDay(selectedDay);
                    });
                  },
                  eventLoader: _getEventsForDay,
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    markerDecoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Tasks for ${_selectedDay!.day} ${_selectedDay!.month}, ${_selectedDay!.year}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                ..._selectedEvents.map((event) {
                  final parts = event.split('|');
                  final title = parts[0].trim();
                  final time = parts.length > 1 ? parts[1].trim() : '';
                  final description = parts.length > 2 ? parts[2].trim() : '';

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                time,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(flex: 3, child: Text(description)),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
