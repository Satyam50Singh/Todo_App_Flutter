import 'package:flutter/material.dart';

class EmptyTodoState extends StatelessWidget {
  const EmptyTodoState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.edit_note_outlined, size: 48, color: Colors.grey),
          SizedBox(height: 12),
          Text(
            "Start writing your todos",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
