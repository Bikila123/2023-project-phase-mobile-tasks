import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_task/features/todo_app/domain/entities/task.dart';
import 'package:go_router_task/features/todo_app/presentation/pages/task_detail.dart';

import '../../features/todo_app/data/repositories/task_repository_impl.dart';
import '../../features/todo_app/domain/repositories/task_repository.dart';
import '../../features/todo_app/domain/usecases/get_tasks_usecase.dart';
import '../../features/todo_app/presentation/pages/create_task_page.dart';
import '../../features/todo_app/presentation/pages/my_home_page.dart';
final TaskRepository taskRepository = TaskRepositoryImpl(); // Instantiate the concrete implementation

final GoRouter router = GoRouter(
  routes: [
GoRoute(
      name: "home",
      path: "/",
      pageBuilder: (context, state) {
        // Return a CustomTransitionPage with the custom slide animation
        return CustomTransitionPage(
          child: MyHomePage(getTasksUseCase: GetTasksUseCase(taskRepository)), // Ensure you pass the use case
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Define your custom slide transition here
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Slide from right to left
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: "task_detail",
      path: "/task_detail",
      pageBuilder: (context, state) {
        // Retrieve the Task object passed via `extra`
        final TaskEntity arguments = state.extra as TaskEntity;
        // Return a CustomTransitionPage with the custom slide animation
        return CustomTransitionPage(
          child: TaskDetail(title: arguments.title, repository: taskRepository), // Pass title to TaskDetail
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Define your custom slide transition here
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Slide from right to left
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: "create_task",
      path: "/create_task",
      pageBuilder: (context, state) {
        // Return a CustomTransitionPage with the custom slide animation
        return CustomTransitionPage(
          child: const CreateTask(), 
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Define your custom slide transition here
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Slide from right to left
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    )
  ],
);
