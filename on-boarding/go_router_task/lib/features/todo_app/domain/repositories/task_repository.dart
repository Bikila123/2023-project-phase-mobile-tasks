import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/task_dto.dart';
import '../entities/task.dart';

abstract class TaskRepository {
  /// Fetch a list of all tasks, returning either a Failure or a List of Task entities.
  Future<Either<Failure, List<TaskEntity>>> getTasks();

  /// Add a new task (returning an Either to handle potential failure)
  Future<Either<Failure, void>> createTask(TaskEntity task);

  /// Fetch a task by its unique ID, returning either a Failure or the specific Task entity.
  Future<Either<Failure, TaskEntity?>> getTaskById(String id);

  Future<Either<Failure, TaskDTO>> getTaskByTitle(String title);
}
