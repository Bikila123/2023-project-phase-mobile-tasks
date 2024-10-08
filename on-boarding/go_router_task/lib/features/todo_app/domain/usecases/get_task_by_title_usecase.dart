import 'package:dartz/dartz.dart'; // For Either type
import 'package:go_router_task/features/todo_app/data/models/task_dto.dart';
import 'package:go_router_task/features/todo_app/domain/repositories/task_repository.dart'; // Update with your actual package name
import 'package:go_router_task/core/error/failures.dart'; // Update with your actual package name

class GetTaskByTitleUseCase {
  final TaskRepository repository;

  GetTaskByTitleUseCase({required this.repository});

  Future<Either<Failure, TaskDTO>> execute(String title) async {
    return await repository.getTaskByTitle(title);
  }
}
