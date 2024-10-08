import 'dart:ui';

class TaskEntity{
  final String iconText;
  final String taskDescription;
  final String dateText;
  final Color taskColor;
  final String title;
  final bool isCompleted;

  const TaskEntity({
    required this.iconText,
    required this.taskDescription,
    required this.dateText,
    required this.taskColor,
    required this.title,
    required this.isCompleted
  });
}