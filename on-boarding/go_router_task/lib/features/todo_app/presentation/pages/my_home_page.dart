import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_task/features/todo_app/domain/entities/task.dart';
import '../../domain/usecases/get_tasks_usecase.dart'; // Update with your actual package name

class MyHomePage extends StatefulWidget {
  final GetTasksUseCase getTasksUseCase;

  const MyHomePage({super.key, required this.getTasksUseCase});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TaskEntity> tasks = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadTasks(); // Load tasks when the page initializes
  }

  Future<void> _loadTasks() async {
    final result = await widget.getTasksUseCase.execute(); // Use the use case to fetch tasks
    setState(() {
      result.fold(
        (failure) {
          isLoading = false;
          errorMessage = failure.message; // Handle failure
        },
        (fetchedTasks) {
          tasks = fetchedTasks;
          isLoading = false; // Set loading to false on success
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            _appBar(),
            Image.asset(
              'images/thingstodo.jpg',
              width: 480,
              height: 320,
              fit: BoxFit.contain,
            ),
            const Text(
              'Tasks list',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            if (isLoading) ...[
              const Center(child: CircularProgressIndicator()), // Show loading indicator
            ] else if (errorMessage != null) ...[
              Center(child: Text(errorMessage!, style: const TextStyle(color: Colors.red))), // Show error message
            ] else ...[
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return TodoCard(task: task);
                  },
                ),
              ),
            ],
            const SizedBox(height: 10),
            _createTaskButton(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Container _appBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Todo List',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Row _createTaskButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            context.goNamed('create_task');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEE6F57),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minimumSize: const Size(270, 40)),
          child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Create Task',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
        ),
      ],
    );
  }
}

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.task,
  });

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.3), // Border color
          width: 2, // Border width
        ),
        borderRadius: BorderRadius.circular(20),
        color: task.isCompleted ? Colors.green.withOpacity(0.2) : Colors.white, // Change background color based on completion status

      ),
      child: ListTile(
        onTap: () {
          context.goNamed('task_detail', extra: task);
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _iconText(),
            const SizedBox(width: 10),
            _taskTitle(),
            _dateText(),
          ],
        ),
      ),
    );
  }

  Row _dateText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          task.dateText,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        _taskColor(),
      ],
    );
  }

  VerticalDivider _taskColor() {
    return VerticalDivider(
      color: task.taskColor,
      thickness: 4,
      indent: 1,
      endIndent: 10,
      width: 20,
    );
  }

  SizedBox _taskTitle() {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            task.title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Text _iconText() {
    return Text(
      task.iconText,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }
}
