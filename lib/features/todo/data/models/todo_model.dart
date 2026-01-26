class TodoModel {
  final String name;
  final String description;
  final String dueDate;
  final String createdAt;

  TodoModel({
    required this.name,
    required this.description,
    required this.dueDate,
    required this.createdAt,
  });

  @override
  String toString() {
    return super.toString();
  }
}
