import 'package:auth_app/core/usecase/params.dart';

class AddTodoParams extends Params {
  String userId;
  String title;
  String description;
  String dueDate;

  AddTodoParams({
    required this.userId,
    required this.title,
    required this.description,
    required this.dueDate,
  });
}
