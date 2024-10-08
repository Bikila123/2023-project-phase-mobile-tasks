import 'dart:ui';

import '../../domain/entities/task.dart';

class TaskDTO {
  final String iconText;
  final String taskDescription;
  final String dateText;
  final int taskColor;  // We store color as an integer for JSON compatibility
  final String title;
  final bool isCompleted;

  TaskDTO({
    required this.iconText,
    required this.taskDescription,
    required this.dateText,
    required this.taskColor,
    required this.title,
    required this.isCompleted,
  });

  // Convert JSON to TaskDTO
  factory TaskDTO.fromJson(Map<String, dynamic> json) {
    return TaskDTO(
      iconText: json['iconText'],
      taskDescription: json['taskDescription'],
      dateText: json['dateText'],
      taskColor: json['taskColor'],  // Store the color as an int (ARGB)
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  // Convert TaskDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'iconText': iconText,
      'taskDescription': taskDescription,
      'dateText': dateText,
      'taskColor': taskColor,  // Convert color to integer (ARGB)
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  // Map TaskDTO to Task entity
  TaskEntity toTask() {
    return TaskEntity(
      iconText: iconText,
      taskDescription: taskDescription,
      dateText: dateText,
      taskColor: Color(taskColor),  // Convert ARGB integer back to Color
      title: title,
      isCompleted: isCompleted,
    );
  }

  // Map Task entity to TaskDTO
  static TaskDTO fromTask(TaskEntity task) {
    return TaskDTO(
      iconText: task.iconText,
      taskDescription: task.taskDescription,
      dateText: task.dateText,
      taskColor: task.taskColor.value,  // Convert Color to ARGB integer
      title: task.title,
      isCompleted: task.isCompleted,
    );
  }
}
