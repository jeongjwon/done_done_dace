import 'package:flutter/material.dart';
import 'package:done_done_dance/database/tasks_provider.dart';
import 'package:done_done_dance/widgets/task.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  final DateTime date;
  // const TasksList({
  //   super.key,
  //   required this.date,
  // });
  const TasksList({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TaskWidget> items =
        Provider.of<TaskListProvider>(context).getTasksForDate(date);

    return ListView.builder(
      key: ValueKey(date),
      itemBuilder: ((context, index) {
        if (items.isEmpty) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              '할 일을 추가하세요',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        } else if (index < items.length) {
          return items[index];
        } else {
          return Container();
        }
      }),
      itemCount: (items.isEmpty) ? 1 : items.length,
    );
  }
}
