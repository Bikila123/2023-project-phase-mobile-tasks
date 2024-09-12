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
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
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
    tasks.add(task); // Add the new task to the list
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
            createTaskButton(),
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
        onTap: () {
          Navigator.pushNamed(context, '/task_detail', arguments: task);
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconText(),
            const SizedBox(width: 10),
            taskTitle(),
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

  SizedBox taskTitle() {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //  const SizedBox(height: 20,),
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

  Text iconText() {
    return Text(
      task.iconText,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }
}
