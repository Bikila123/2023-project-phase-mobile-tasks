import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router_task/features/todo_app/data/models/task_dto.dart';
import 'package:mockito/mockito.dart';
import 'package:go_router_task/features/todo_app/domain/entities/task.dart';
import 'package:go_router_task/features/todo_app/domain/repositories/task_repository.dart';
import 'package:go_router_task/features/todo_app/domain/usecases/get_task_by_title_usecase.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late GetTaskByTitleUseCase getTaskByTitleUseCase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    getTaskByTitleUseCase = GetTaskByTitleUseCase(repository: mockTaskRepository);
  });

  const String tTitle = "Test Task";

   TaskDTO tTask =  TaskDTO(
    title: tTitle,
    taskDescription: "Description for test task",
    dateText: "October 7, 2024",
    taskColor:  0xFFEE6F57,
    iconText: "T",
    isCompleted: false,
  );
 test('should get task by title from the repository', () async {
    // Arrange
    when(mockTaskRepository.getTaskByTitle("Football CU Dry-bling"))
        .thenAnswer((_) async => Right(tTask));

    // Act
    final result = await getTaskByTitleUseCase.execute(tTitle);

    // Assert
    expect(result, Right(tTask));
    verify(mockTaskRepository.getTaskByTitle(tTitle));
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
