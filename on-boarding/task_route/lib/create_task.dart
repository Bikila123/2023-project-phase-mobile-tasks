import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_route/task_model.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});
  @override
  // ignore: no_logic_in_create_state
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _titleController;
  final TextEditingController _descriptionController;
  final TextEditingController _dueDateController;

  // Constructor to initialize all controllers
  _CreateTaskState()
      : _titleController = TextEditingController(),
        _descriptionController = TextEditingController(),
        _dueDateController = TextEditingController();

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
            const SizedBox(height: 20),
            const Text(
              'Create Task',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const Divider(
              height: 10,
            ),
            const SizedBox(height: 20),
            taskDetails(),
            const SizedBox(height: 20),
            createTaskButton()
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
              hintText: 'UI/UX design',
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
              hintText:
                  'First I have to animate the logo and later prototyping my design. It\'s very important',
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
          readOnly: true, //prevent from editing
          decoration: InputDecoration(
            hintText: 'April, 29, 2023',
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
      ],
    );
  }

  Row createTaskButton() {
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
            // new task creation that will be persistent could be written here
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
                'Add Task',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
        ),
      ],
    );
  }
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
        const Icon(
          Icons.more_vert,
          size: 24,
        )
      ],
    ),
  );
}
