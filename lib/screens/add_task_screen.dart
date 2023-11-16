import 'package:done_done_dance/database/tasks_provider.dart';
import 'package:done_done_dance/widgets/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  final DateTime selectedDate;
  // const AddTaskScreen({super.key});

  const AddTaskScreen({
    Key? key,
    required this.selectedDate, // 생성자에 날짜 전달 받기
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Your task',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5AA566)),
            ),
            TextField(
              autofocus: true,
              onChanged: ((value) {
                newTaskTitle = value;
              }),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF5AA566),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF5AA566),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                if (newTaskTitle != null) {
                  Provider.of<TaskListProvider>(context, listen: false)
                      .addTaskForDate(
                    selectedDate,
                    TaskWidget(
                        isChecked: false,
                        taskTitle: newTaskTitle!,
                        date: selectedDate),
                  );
                  Navigator.pop(context);
                }
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF5AA566),
              ),
              child: const Text(
                "Add the task",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}
