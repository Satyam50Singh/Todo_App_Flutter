import 'package:flutter/material.dart';

import '../../../../../core/theme/app_button_styles.dart';
import '../../../../../core/theme/pallete.dart';

class AddTodoButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddTodoButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        label: Text('Add Todo', style: TextStyle(fontSize: 16)),
        icon: Icon(Icons.add),
        onPressed: onPressed,
        style: AppButtonStyles.customButtonStyle(
          backgroundColor: Pallete.gradient1,
        ),
      ),
    );
  }
}
