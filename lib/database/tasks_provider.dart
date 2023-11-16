import 'package:done_done_dance/widgets/task.dart';
import 'package:flutter/material.dart';

class TaskListProvider extends ChangeNotifier {
  final Map<DateTime, List<TaskWidget>> _tasksByDate = {};

  List<TaskWidget> getTasksForDate(DateTime date) {
    return _tasksByDate[date] ?? [];
  }

  void addTaskForDate(DateTime date, TaskWidget task) {
    if (!_tasksByDate.containsKey(date)) {
      _tasksByDate[date] = [];
    }

    _tasksByDate[date]!.add(task);
    notifyListeners();
  }

  void deleteTaskForDate(DateTime date, TaskWidget task) {
    if (_tasksByDate.containsKey(date) && _tasksByDate[date]!.contains(task)) {
      _tasksByDate[date]!.remove(task);
      notifyListeners();
    }
  }
}
