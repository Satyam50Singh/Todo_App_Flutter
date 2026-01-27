import 'package:flutter/material.dart';

import '../../../../../core/theme/pallete.dart';
import 'logout_icon_button.dart';

class TodoListAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPressed;

  const TodoListAppBar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Todo List"),
      backgroundColor: Pallete.gradient1,
      foregroundColor: Colors.white,
      elevation: 4,
      actions: [LogoutIconButton(onPressed: onPressed)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
