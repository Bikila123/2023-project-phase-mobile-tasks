import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:task_route/create_task.dart';

void main() {
  group('CreateTask Widget Tests', () {
    testWidgets('Test Task Creation screen', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MaterialApp(home: CreateTask()));

      // Verify the title, description, and deadline fields are present
      expect(find.text('Create Task'), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('Deadline'), findsOneWidget);
      expect(find.text('Add Task'), findsOneWidget);
    });

    testWidgets('Input fields should update text correctly', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MaterialApp(home: CreateTask()));

      // Enter text in title and description fields
      await tester.enterText(find.byType(TextField).first, 'Test Task Title');
      await tester.enterText(find.byType(TextField).at(1), 'Test Task Description');

      // Verify that the text is updated in the TextFields
      expect(find.text('Test Task Title'), findsOneWidget);
      expect(find.text('Test Task Description'), findsOneWidget);
    });

    testWidgets('Select date from the DatePicker', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MaterialApp(home: CreateTask()));

      // Tap on the date field to show the DatePicker
      await tester.tap(find.byIcon(Icons.calendar_today));
      await tester.pumpAndSettle();

      // Select a date from the DatePicker
      await tester.tap(find.text('15')); // Select the 15th of the current month
      await tester.tap(find.text('OK')); // Confirm the date selection
      await tester.pumpAndSettle();

      // Verify that the formatted date is shown in the date TextField
      final expectedDate = DateFormat('MMMM, d, yyyy').format(DateTime(DateTime.now().year, DateTime.now().month, 15));
      expect(find.text(expectedDate), findsOneWidget);
    });
  });
}

