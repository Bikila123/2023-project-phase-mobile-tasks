import "Task.dart";

class TaskManager extends Task {
  TaskManager(super.title, super.description, super.dueDate, super.status);
  addTask() {
    return Task(this.title, this.description, this.dueDate, this.status);
  }

  viewAllTasks(List<Task> tasks) {
    print("All Tasks: $tasks");
  }

  viewCompletedTasks(List<Task> tasks) {
    List<Task> completedTasks =
        tasks.where((task) => task.status == 'completed').toList();
    print("Completed Tasks: $completedTasks");
  }

  viewPendingTasks(List<Task> tasks) {
    List<Task> pendingTasks =
        tasks.where((task) => task.status == 'pending').toList();
    print("Pending Tasks: $pendingTasks");
  }

  editTask(List<Task> tasks, String? taskName,
      {String? newtitle,
      String? newdescription,
      DateTime? newdueDate,
      String? newstatus}) {
    for (var task in tasks) {
      if (task.title == taskName) {
        if (newtitle != null && newtitle.isNotEmpty) task.title = newtitle;
        if (newdescription != null && newdescription.isNotEmpty) task.description = newdescription;
        if (newdueDate != null && newdueDate.toString().isNotEmpty) task.dueDate = newdueDate;
        if (newstatus != null && newstatus.isNotEmpty) task.status = newstatus;

        print("Task $taskName has been updated");
      } else {
        print("Task not found");
      }
    }
  }

  deleteTask(List<Task> tasks, String? taskName) {
    tasks.removeWhere((Task) => Task.title == taskName);
    print("Task $taskName has been deleted!");
  }
}
