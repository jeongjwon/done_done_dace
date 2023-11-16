import 'package:done_done_dance/database/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatefulWidget {
  String taskTitle;
  bool? isChecked = false;
  DateTime date;

  TaskWidget({
    // super.key,
    Key? key,
    required this.taskTitle,
    required this.isChecked,
    required this.date,
  }) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedColor: widget.isChecked! ? Colors.grey : Colors.black,
      leading: TaskCheckBox(
        isChecked: widget.isChecked,
        onCheckboxchange: (value) {
          setState(() {
            widget.isChecked = value;
          });
        },
      ),
      title: GestureDetector(
        onTap: () {
          if (widget.isChecked!) {
            Provider.of<TaskListProvider>(context, listen: false)
                .deleteTaskForDate(widget.date, widget);
          }
        },
        child: Text(
          widget.taskTitle.isNotEmpty ? widget.taskTitle : 'No Title',
          style: TextStyle(
              fontFamily: "Lato",
              fontSize: 20,
              color: Colors.black,
              decoration: widget.isChecked!
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  bool? isChecked = false;
  final Function(bool?) onCheckboxchange;
  TaskCheckBox({super.key, required this.onCheckboxchange, this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.grey,
      onChanged: onCheckboxchange,
      value: isChecked,
    );
  }
}
