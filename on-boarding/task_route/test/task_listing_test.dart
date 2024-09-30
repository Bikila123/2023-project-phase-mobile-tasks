import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_route/main.dart';
import 'package:task_route/task_model.dart';
import 'package:task_route/task_detail.dart';

void main() {
 testWidgets('Tapping task navigates to task detail', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: const MyHomePage(),
      onGenerateRoute: (settings) {
        if (settings.name == '/task_detail') {
          final task = settings.arguments as Task;
          return MaterialPageRoute(
            builder: (context) => TaskDetail(task: task),
          );
        }
        return null;
      },
    ),
  );
  
  // Wait for rendering
  await tester.pumpAndSettle();
  
  // Check if the task "UI/UX App Design" exists
  expect(find.text('UI/UX App Design'), findsOneWidget);
  
  // Tap the task and navigate to the task detail
  await tester.tap(find.text('UI/UX App Design'));
  await tester.pumpAndSettle();
  
  // Check if navigation to detail page occurred
  expect(find.text('UI/UX App Design'), findsOneWidget);
});

}
