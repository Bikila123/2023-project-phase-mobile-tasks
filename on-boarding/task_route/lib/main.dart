import 'package:flutter/material.dart';
import 'package:task_route/create_task.dart';
import 'package:task_route/fade_route.dart';
import 'package:task_route/task_detail.dart';
import 'package:task_route/task_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFEE6F57)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(), //Home route
      },
      onGenerateRoute: (settings) {
        return _generateRoute(settings);
      },
    );
  }

  // Route generator with FadePageRoute for named routes
  Route<dynamic>? _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return FadePageRoute(page: const MyHomePage());
      case '/task_detail':
        final arguments = settings.arguments as Task;
        return FadePageRoute(page: TaskDetail(task: arguments));
      case '/create_task':
        return FadePageRoute(page: const CreateTask());
      default:
        return FadePageRoute(page: const MyHomePage());
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> tasks = [
    Task(
      iconText: 'U',
      taskDescription:
          'First I have to animate the logo and later prototyping my design. It\'s very important',
      dateText: 'April, 29, 2023',
      taskColor: Colors.green,
      title: 'UI/UX App Design',
    ),
    Task(
        iconText: 'V',
        taskDescription:
            'First I have to animate the logo and later prototyping my design. It\'s very important',
        dateText: 'April, 29, 2023',
        taskColor: Colors.yellow,
        title: 'View candidates'),
    Task(
        iconText: 'F',
        taskDescription:
            'First I have to animate the logo and later prototyping my design. It\'s very important',
        dateText: 'April, 29, 2023',
        taskColor: Colors.red,
        title: 'Football CU Dry-bling'),
  ];

  // Method to add a task
  void addTask(Task task) {
    setState(() {
      tasks.add(task); // Add the new task to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                appBar(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Image.asset(
                    'images/thingstodo.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tasks list',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true, // Allows ListView to size itself
                  physics: const NeverScrollableScrollPhysics(), // Prevents nested scrolling
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return TodoCard(task: task);
                  },
                ),
                const SizedBox(height: 20),
                createTaskButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container appBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: const Center(
        child: Text(
          'Todo List',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
    );
  }

  Row createTaskButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/create_task');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFEE6F57),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(270, 40),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Create Task',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
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
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.3), // Border color
          width: 2, // Border width
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/task_detail', arguments: task);
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconText(),
            const SizedBox(width: 10),
            Expanded(child: taskTitle()), // Allows flexible space for title
            dateText(),
          ],
        ),
      ),
    );
  }

  Column dateText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
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

  Widget taskTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task.title,
          style: const TextStyle(
            fontSize: 16,
          ),
          overflow: TextOverflow.ellipsis, // Prevents overflow of long titles
        ),
      ],
    );
  }

  Text iconText() {
    return Text(
      task.iconText,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }
}
