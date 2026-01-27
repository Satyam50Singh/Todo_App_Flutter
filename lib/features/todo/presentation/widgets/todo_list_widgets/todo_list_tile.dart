import 'dart:convert';

import 'package:auth_app/features/todo/data/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';

class TodoListTile extends StatelessWidget {
  final TodoModel todoModel;

  const TodoListTile({super.key, required this.todoModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: const Icon(Icons.check_circle_outline, color: Colors.purple),
      title: Text(
        todoModel.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          QuillEditor.basic(
            controller: QuillController(
              readOnly: true,
              document: Document.fromDelta(
                Delta.fromJson(jsonDecode(todoModel.description)),
              ),
              selection: const TextSelection.collapsed(offset: 0),
            ),
            // read: true,
          ),
          const SizedBox(height: 12),
          if (todoModel.dueDate.isNotEmpty)
            Row(
              children: [
                const Icon(Icons.calendar_month, size: 18, color: Colors.red),
                const SizedBox(width: 4),
                Text(
                  "Due Date: ${todoModel.dueDate}",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
