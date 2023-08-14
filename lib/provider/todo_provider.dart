import 'package:flutter/material.dart';
import '../model/task_model.dart';

class ToDoProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  int _nextID = 1;
  List<Task> get tasks => _tasks;
  // List<Task> _filteredTasks = [];

  // void filterTask(String keyword) {
  //   if (keyword.isEmpty) {
  //     _filteredTasks = _tasks;
  //   } else {
  //     _filteredTasks = _tasks
  //         .where((task) =>
  //             task.title.toLowerCase().contains(keyword.toLowerCase()))
  //         .toList();
  //   }
  //   notifyListeners();
  // }

  void addTask(String title) {
    _tasks.add(Task(id: _nextID, title: title));
    _nextID++;
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
