class TodoModel {
  final String userId;
  final String title;
  final String description;
  final String dueDate;
  final String createdAt;

  TodoModel({
    required this.userId,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.createdAt,
  });

  @override
  String toString() {
    return super.toString();
  }
}
