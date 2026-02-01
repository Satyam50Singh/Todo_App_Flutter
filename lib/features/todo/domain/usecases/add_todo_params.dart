import 'package:auth_app/core/usecase/params.dart';

class AddTodoParams extends Params {
  String title;
  String description;
  String dueDate;

  AddTodoParams({
    required this.title,
    required this.description,
    required this.dueDate,
  });
}
