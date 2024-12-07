import "dart:io";
import "Task.dart";
import "taskmanager.dart";

void main() {
  int? opt;
  List<Task> tasks = [];

  TaskManager? taskManager;
  do {
    print("Task Manager Menus:");
    print("----------------------------------------------");
    print("1 to add task");
    print("2 to view all tasks");
    print("3 to view all completed tasks");
    print("4 to view all pending tasks");
    print("5 to edit task");
    print("6 to delete task");
    print("press 0 to exit");
    print("----------------------------------------------");
    print("Enter your choice:");
    opt = int.parse(stdin.readLineSync() ?? '0');
    if (opt == 1) {
      //new task creation
      print("Please enter the title of the task!");
      String? title = stdin.readLineSync();
      print("Please enter the description of the task!");
      String? description = stdin.readLineSync();
      print("Please enter due date of the task! example: YYYY-MM-DD");
      DateTime? dueDate;
      String? date = stdin.readLineSync();
      //check date format before parse
      if (date != null && date.isNotEmpty) {
        try {
          dueDate = DateTime.parse(date);
        } catch (e) {
          print(
              "Invalid date format. Please enter the date in the format YYYY-MM-DD.");
        }
      } else {
        print("Date input is empty, no date will be set.");
      }
      print(
          "Please enter 'completed' if task is completed or 'pending' if task is not completed");
      String? status = stdin.readLineSync();

      taskManager = new TaskManager(title, description, dueDate, status);
      var addedtask = taskManager.addTask();
      tasks.add(addedtask);
      print("Task added!");
    } else if (opt == 2) {
      //call method that lists all task
      taskManager?.viewAllTasks(tasks);
    } else if (opt == 3) {
      //call method that lists all completed tasks
      taskManager?.viewCompletedTasks(tasks);
    } else if (opt == 4) {
      //call method that list all pending tasks
      taskManager?.viewPendingTasks(tasks);
    } else if (opt == 5) {
      // edit task
      print("Please enter title of task that you wanna edit");
      String? taskName = stdin.readLineSync();
      print("Please enter new title of the task!");
      String? newtitle = stdin.readLineSync();
      print("Please enter new description of the task!");
      String? newdescription = stdin.readLineSync();
      print("Please enter new due date of the task! example: YYYY-MM-DD");
      String? date = stdin.readLineSync();
      DateTime? newdueDate;
      //check new due date before parse
      if (date != null && date.isNotEmpty) {
        try {
          newdueDate = DateTime.parse(date);
        } catch (e) {
          print(
              "Invalid date format. Please enter the date in the format YYYY-MM-DD.");
        }
      } else {
        print("Date input is empty, no date will be set.");
      }
      print(
          "Please enter 'completed' if task is completed or 'pending' if task is not completed");
      String? newstatus = stdin.readLineSync();

      taskManager?.editTask(tasks, taskName,
          newtitle: newtitle,
          newdescription: newdescription,
          newdueDate: newdueDate,
          newstatus: newstatus);
    } else if (opt == 6) {
      print("Please enter title of task that you wanna remove from tasks");
      String? taskName = stdin.readLineSync();
      taskManager?.deleteTask(tasks, taskName);
    }
  } while (opt != 0);
}
