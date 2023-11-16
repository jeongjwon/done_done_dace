import 'package:done_done_dance/screens/add_task_screen.dart';
import 'package:done_done_dance/widgets/tasks_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  void _updateSelectedDate(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Theme.of(context).focusColor,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Done Done Dance'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen(selectedDate: _selectedDate))),
              isScrollControlled: true);
        },
        backgroundColor: const Color(0xFF5AA566),
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: DayTask(
        date: _selectedDate,
        onDateChanged: _updateSelectedDate,
      ),
    );
  }
}

class DayTask extends StatelessWidget {
  final DateTime date;
  final Function(DateTime) onDateChanged;

  const DayTask({
    Key? key,
    required this.date,
    required this.onDateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  DateTime yesterday = date.subtract(const Duration(days: 1));
                  onDateChanged(yesterday);
                },
                icon: const Icon(Icons.chevron_left),
                iconSize: 50,
                color: const Color(0xFF5AA566),
              ),
              Text(
                '${date.year}년 ${date.month}월 ${date.day}일',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5AA566),
                ),
              ),
              IconButton(
                onPressed: () {
                  DateTime tomorrow = date.add(const Duration(days: 1));
                  onDateChanged(tomorrow);
                },
                icon: const Icon(Icons.chevron_right),
                iconSize: 50,
                color: const Color(0xFF5AA566),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TasksList(
                date: date,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
