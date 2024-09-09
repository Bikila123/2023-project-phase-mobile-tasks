import 'package:flutter/material.dart';

import 'task_model.dart';

class TodoList extends StatelessWidget {
  TodoList({super.key});
  final List<Task> tasks = [
    Task(
      iconText: 'U',
      taskDescription: 'UI/UX App Design',
      dateText: 'April, 29, 2023',
      taskColor: Colors.green,
    ),
    Task(
      iconText: 'V',
      taskDescription: 'View candidates',
      dateText: 'April, 29, 2023',
      taskColor: Colors.yellow,
    ),
    Task(
      iconText: 'F',
      taskDescription: 'Football CU Dry-bling',
      dateText: 'April, 29, 2023',
      taskColor: Colors.red,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            appBar(),
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
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TodoCard(task: task);
                },
              ),
            ),
            const SizedBox(height: 10),
            createTask(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Container appBar() {
    return Container(
            margin: const EdgeInsets.only(bottom: 1),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                  color: Color(0xFFEE6F57),
                ),
                Text(
                  'Todo List',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Icon(
                  Icons.more_vert,
                  size: 24,
                )
              ],
            ),
          );
  }

  Row createTask() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
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

  final Task task;

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
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconText(),
            const SizedBox(width: 10),
            taskDescription(),
            dateText()
          ],
        ),
      ),
    );
  }

  Row dateText() {
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
        taskColor(),
      ],
    );
  }

  VerticalDivider taskColor() {
    return VerticalDivider(
      color: task.taskColor,
      thickness: 4,
      indent: 1,
      endIndent: 10,
      width: 20,
    );
  }

  SizedBox taskDescription() {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //  const SizedBox(height: 20,),
          Text(
            task.taskDescription,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Text iconText() {
    return Text(
      task.iconText,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }
}
