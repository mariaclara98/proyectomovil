class Task {
  String title;
  String description;
  bool taskState;

  Task(
      {required this.title, required this.description, this.taskState = false});
}
