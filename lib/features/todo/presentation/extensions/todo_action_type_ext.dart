import 'package:auth_app/core/enums/todo_action_type.dart';
import 'package:flutter/material.dart';

extension TodoActionTypeX on TodoActionType {
  String get label {
    switch (this) {
      case TodoActionType.copy:
        return 'Copy';
      case TodoActionType.delete:
        return 'Delete';
      case TodoActionType.share:
        return 'Share';
    }
  }

  IconData get icon {
    switch (this) {
      case TodoActionType.copy:
        return Icons.copy;
      case TodoActionType.delete:
        return Icons.delete;
      case TodoActionType.share:
        return Icons.share;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case TodoActionType.copy:
        return Colors.grey;
      case TodoActionType.delete:
        return Colors.red;
      case TodoActionType.share:
        return Colors.blue;
    }
  }

  Color get foregroundColor => Colors.white;
}
