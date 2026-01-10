import 'package:flutter/material.dart';

import '../../../../../core/theme/pallete.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const LoginField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 365),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.borderColor, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.gradient2, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
