import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_task/create_task.dart';
import 'package:go_router_task/main.dart';
import 'package:go_router_task/task_detail.dart';
import 'package:go_router_task/task_model.dart';

final GoRouter router = GoRouter(
  routes: [
GoRoute(
      name: "home",
      path: "/",
      pageBuilder: (context, state) {
        // Return a CustomTransitionPage with the custom slide animation
        return CustomTransitionPage(
          child: const MyHomePage(), 
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
        final Task arguments = state.extra as Task;
        // Return a CustomTransitionPage with the custom slide animation
        return CustomTransitionPage(
          child: TaskDetail(task: arguments), // Pass the task to TaskDetail
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
