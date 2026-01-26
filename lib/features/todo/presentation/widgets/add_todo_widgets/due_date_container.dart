import 'package:flutter/material.dart';

import 'due_date_row.dart';

class DueDateContainer extends StatelessWidget {
  final bool isDueDateRequired;
  final TextEditingController dateController;
  final VoidCallback onInkWellTap;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onCalendarTextFieldTap;


  const DueDateContainer({
    super.key,
    required this.isDueDateRequired,
    required this.dateController,
    required this.onInkWellTap,
    required this.onChanged,
    required this.onCalendarTextFieldTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          InkWell(
            onTap: onInkWellTap,
            child: DueDateRow(
              isDueDateRequired: isDueDateRequired,
              onChanged: onChanged,
            ),
          ),
          if (isDueDateRequired) ...[
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: "Select Due Date",
                    ),
                    readOnly: true,
                    onTap: onCalendarTextFieldTap,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}
