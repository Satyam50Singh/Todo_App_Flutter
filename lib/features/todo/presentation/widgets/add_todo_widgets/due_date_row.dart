import 'package:flutter/material.dart';

class DueDateRow extends StatelessWidget {
  final bool isDueDateRequired;
  final ValueChanged<bool?> onChanged;

  const DueDateRow({
    super.key,
    required this.isDueDateRequired,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isDueDateRequired,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4), // square-ish
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Add a due date',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
