class TodoEntity {
  final int todoId;
  final String title;
  final String description;
  final String dueDate;
  final int remainingDays;

  TodoEntity({
    required this.todoId,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.remainingDays,
  });
}
