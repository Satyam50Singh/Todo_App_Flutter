import 'package:flutter/material.dart';

import '../../../../../core/theme/pallete.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  const LoginField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 365),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: isPassword ? TextInputAction.done : TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: isPassword
              ? const Icon(Icons.lock_rounded)
              : const Icon(Icons.email),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 24,
          ),
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
