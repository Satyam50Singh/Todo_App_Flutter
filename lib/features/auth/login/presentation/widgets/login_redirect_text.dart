import 'package:flutter/material.dart';

class LoginRedirectText extends StatelessWidget {
  final VoidCallback onTap;

  const LoginRedirectText({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?"),
        SizedBox(width: 5),
        InkWell(
          child: Text(
            'Register now',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
