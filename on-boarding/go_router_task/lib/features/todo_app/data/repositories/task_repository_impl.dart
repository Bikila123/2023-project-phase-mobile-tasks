// data/repositories/task_repository_impl.dart

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../../../core/error/failures.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../models/task_dto.dart';  // Import TaskDTO

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks() async {
    try {
      // Load the tasks.json file
      final String jsonString = await rootBundle.loadString('assets/todo_data.json');
      
      // Parse the JSON string into a List of dynamic objects
      List<dynamic> jsonData = json.decode(jsonString);
      
      // Convert the List of dynamic objects into TaskDTO objects
      List<TaskDTO> taskDTOs = jsonData.map((json) => TaskDTO.fromJson(json)).toList();
      
      // Convert TaskDTOs to Task entities
      List<TaskEntity> tasks = taskDTOs.map((dto) => dto.toTask()).toList();
      
      return Right(tasks);  // Return the tasks in the Right side of Either
    } catch (e) {
      return Left(ServerFailure('Failed to load tasks: ${e.toString()}'));  // Return failure on the Left
    }
  }

  @override
  Future<Either<Failure, void>> createTask(TaskEntity task) async {
    try {
      // Logic for creating a task (not implemented due to JSON limitations)
      return Right(null);  // Return success with null value in the Right side
    } catch (e) {
      return Left(ServerFailure('Failed to create task: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, TaskEntity?>> getTaskById(String id) async {
    try {
      // You would implement logic to get a task by ID here
      return Right(null);  // Example placeholder return value
    } catch (e) {
      return Left(ServerFailure('Failed to get task by ID: ${e.toString()}'));
    }
  }
  
@override
  Future<Either<Failure, TaskDTO>> getTaskByTitle(String title) async {
    try {
      // Load the JSON file from assets
      final String jsonString = await rootBundle.loadString('assets/todo_data.json');
      final List<dynamic> jsonData = json.decode(jsonString);

      // Find the task with the given title
      final taskData = jsonData.firstWhere((task) => task['title'] == title, orElse: () => null);

      if (taskData != null) {
        // Map the JSON data to a TaskEntity
        final task = TaskDTO.fromJson(taskData);
        return Right(task); // Return the task if found
      } else {
        return Left(ServerFailure("Server Error")); // Handle case where task is not found
      }
    } catch (e) {
      return Left(ServerFailure("Server Error")); // Handle errors as needed
    }
  }
}
