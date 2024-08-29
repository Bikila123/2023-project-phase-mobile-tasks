class Task {
  String? title;
  String? description;
  DateTime? dueDate;
  String? status;

  Task(String? title, String? description, DateTime? dueDate, String? status) {
    this.title = title;
    this.description = description;
    this.dueDate = dueDate;
    this.status = status;
  }

  @override
  String toString() {
    return 'Task(name: $title, description:$description, duedate:$dueDate, status: $status)';
  }
}
