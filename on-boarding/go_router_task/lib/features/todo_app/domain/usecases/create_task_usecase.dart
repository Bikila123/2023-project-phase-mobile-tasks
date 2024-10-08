import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class CreateTaskUseCase {
  final TaskRepository repository;

  // Constructor to initialize the repository
  CreateTaskUseCase(this.repository);

  // The function that creates a task
  Future<Either<Failure, void>> call(TaskEntity task) async {
    return await repository.createTask(task);
  }
}
