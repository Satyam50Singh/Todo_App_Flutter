import 'package:flutter/material.dart';

import '../../../../../core/theme/pallete.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Pallete.gradient1, Pallete.gradient2, Pallete.gradient3],
          begin: Alignment.bottomRight,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),

      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(365, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: const Text(
          'Sign in',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
      ),
    );
  }
}
