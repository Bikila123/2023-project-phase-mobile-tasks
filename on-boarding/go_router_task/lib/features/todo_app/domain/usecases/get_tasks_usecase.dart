
import 'package:dartz/dartz.dart';
import 'package:go_router_task/features/todo_app/domain/entities/task.dart';
import '../../../../core/error/failures.dart';
import '../repositories/task_repository.dart'; // Make sure you have the dartz package added

class GetTasksUseCase {
  final TaskRepository taskRepository;

  GetTasksUseCase(this.taskRepository);

  Future<Either<Failure, List<TaskEntity>>> execute() async {
    return await taskRepository.getTasks(); // Call the repository to fetch tasks
  }
}
