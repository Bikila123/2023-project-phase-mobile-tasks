import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_task/features/todo_app/domain/entities/task.dart';
import 'package:go_router_task/features/todo_app/domain/usecases/get_task_by_title_usecase.dart';
import 'package:go_router_task/features/todo_app/domain/repositories/task_repository.dart';
import 'package:intl/intl.dart'; // Import repository

class TaskDetail extends StatefulWidget {
  final String title;
  final TaskRepository repository; // Add repository to the constructor

  const TaskDetail({required this.title, required this.repository, super.key});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  bool? isCompleted = false;
  final TextEditingController _titleController;
  final TextEditingController _descriptionController;
  final TextEditingController _dueDateController;

  // Now pass the repository to the use case
  late final GetTaskByTitleUseCase getTaskByTitleUseCase;

  _TaskDetailState()
      : _titleController = TextEditingController(),
        _descriptionController = TextEditingController(),
        _dueDateController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize the use case by passing the repository
    getTaskByTitleUseCase =
        GetTaskByTitleUseCase(repository: widget.repository);

    // Fetch the task after initializing the use case
    _fetchTask();
  }

  Future<void> _fetchTask() async {
    final result = await getTaskByTitleUseCase.execute(widget.title);
    setState(() {
      result.fold(
        (failure) {
          // Handle failure
          if (kDebugMode) {
            print(failure.message);
          } // or show a message to the user
        },
        (fetchedTask) {
          _titleController.text = fetchedTask.title;
          _descriptionController.text = fetchedTask.taskDescription;
          _dueDateController.text = fetchedTask.dateText;
          isCompleted = fetchedTask.isCompleted;
        },
      );
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('MMMM, d, yyyy').format(selectedDate);
      setState(() {
        _dueDateController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            appBar(context),
            detailImage(),
            const SizedBox(height: 15),
            taskDetails(),
          ],
        ),
      ),
    );
  }

  Column taskDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Title',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEE6F57)),
          ),
        ),
        TextField(
          controller: _titleController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.grey[100]),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Description',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEE6F57)),
          ),
        ),
        TextField(
          maxLines: 4,
          controller: _descriptionController,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.grey[100]),
          style: const TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Deadline',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEE6F57)),
          ),
        ),
        TextField(
          controller: _dueDateController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: const EdgeInsets.all(10),
            filled: true,
            fillColor: Colors.grey[100],
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () {
                _selectDate(context);
              },
            ),
          ),
          onTap: () {
            _selectDate(context);
          },
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Is Completed',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEE6F57)),
          ),
        ),
        Checkbox(
            value: isCompleted,
            onChanged: (bool? newBool) {
              setState(() {
                isCompleted = newBool;
              });
            }),
        const SizedBox(height: 20),
        updateTaskButton()
      ],
    );
  }

  Image detailImage() {
    return Image.asset(
      'images/taskdetails.jpg',
      width: 480,
      height: 280,
      fit: BoxFit.contain,
    );
  }

  Row updateTaskButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            TaskEntity task = TaskEntity(
              title: _titleController.text,
              taskDescription: _descriptionController.text,
              dateText: _dueDateController.text,
              taskColor: Colors.green,
              iconText: _titleController.text.isNotEmpty
                  ? _titleController.text[0]
                  : '',
              isCompleted: isCompleted ?? false,
            );

            if (kDebugMode) {
              print(task);
            }
            // Update code will be here by using the updated data
            context.goNamed('home');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEE6F57),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minimumSize: const Size(270, 40)),
          child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Update Task',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
        ),
      ],
    );
  }

  Container appBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.goNamed('home');
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Color(0xFFEE6F57),
            ),
          ),
          const Text(
            'Task Detail',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const Icon(
            Icons.more_vert,
            size: 24,
          )
        ],
      ),
    );
  }
}
