import 'package:flutter/material.dart';

class LogoutIconButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LogoutIconButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(Icons.logout));
  }
}
