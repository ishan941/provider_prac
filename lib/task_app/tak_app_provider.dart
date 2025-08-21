import 'package:flutter/material.dart';

class TaskAppProvider with ChangeNotifier {
  //
  // Controller
  final TextEditingController textController = TextEditingController();

  //
  // Variables

  final List<String> _task = [];
  final List<String> _completedTask = [];

  List<String> get task => _task;
  List<String> get completedTask => _completedTask;

  // Functions
  void addTask(String task) {
    _task.add(task);
    notifyListeners();
  }

  void removeTask(String task) {
    _task.remove(task);
    notifyListeners();
  }

  void addCompletedTask(String task) {
    _completedTask.add(task);
    notifyListeners();
  }
}
