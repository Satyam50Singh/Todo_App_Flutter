import 'package:auth_app/core/enums/todo_action_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../extensions/todo_action_type_ext.dart';

class TodoSlidableAction extends StatelessWidget {
  final TodoActionType todoActionType;
  final SlidableActionCallback onPressed;

  const TodoSlidableAction({
    super.key,
    required this.todoActionType,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: onPressed,
      backgroundColor: todoActionType.backgroundColor,
      foregroundColor: todoActionType.foregroundColor,
      icon: todoActionType.icon,
      label: todoActionType.label,
    );
  }
}
