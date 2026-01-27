import 'package:flutter/material.dart';

class RegisterRedirectText extends StatelessWidget {
  final VoidCallback onPressed;

  const RegisterRedirectText({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        SizedBox(width: 5),
        InkWell(
          child: Text(
            'Login now',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          onTap: onPressed,
        ),
      ],
    );
  }
}
