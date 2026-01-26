import 'package:flutter/material.dart';

class TitleField extends StatelessWidget {
  final TextEditingController titleController;

  const TitleField({super.key, required this.titleController});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextFormField(
          controller: titleController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Enter Title",
          ),
        ),
      ),
    );
  }
}
