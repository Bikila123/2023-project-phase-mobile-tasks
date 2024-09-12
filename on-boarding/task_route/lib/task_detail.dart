import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_route/task_model.dart';

class TaskDetail extends StatefulWidget {
  final Task task;
  const TaskDetail({required this.task, super.key});
  @override
  // ignore: no_logic_in_create_state
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  final TextEditingController _titleController;
  final TextEditingController _descriptionController;
  final TextEditingController _dueDateController;

  // Constructor to initialize all controllers
  _TaskDetailState()
      : _titleController = TextEditingController(),
        _descriptionController = TextEditingController(),
        _dueDateController = TextEditingController();

//setting up any initial state that depends on the widget's dependencies
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Set initial values for each controller based on the task data
    _titleController.text = widget.task.title;
    _descriptionController.text = widget.task.taskDescription;
    _dueDateController.text = widget.task.dateText;
  }

//dispose method to prevent memory leaks
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }

  // Method to show the DatePicker and format the selected date
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date as the default
      firstDate: DateTime(2000), // Earliest date selectable
      lastDate: DateTime(2100), // Latest date selectable
    );

    if (selectedDate != null) {
      // Format the date as "April, 29, 2023"
      String formattedDate = DateFormat('MMMM, d, yyyy').format(selectedDate);

      // Update the text field with the formatted date
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
                // Show the date picker when the icon is pressed
                _selectDate(context);
              },
            ),
          ),
          onTap: () {
            // Show the DatePicker when the field is tapped
            _selectDate(context);
          },
        ),
        const SizedBox(
          height: 20,
        ),
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
            Task task = Task(
                iconText: _titleController.text[1],
                taskDescription: _descriptionController.text,
                dateText: _dueDateController.text,
                taskColor: Colors.green,
                title: _titleController.text);
                if (kDebugMode) {
                  print(task);
                }
              //update code will be here by using the updated data
            Navigator.pushNamed(context, '/');
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
              Navigator.pop(context); // Navigates back to the previous page
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
