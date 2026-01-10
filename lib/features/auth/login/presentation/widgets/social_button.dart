import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/pallete.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String labelText;
  final double horizontalPadding;

  const SocialButton({
    super.key,
    required this.iconPath,
    required this.labelText,
    this.horizontalPadding = 90,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(iconPath, width: 25, color: Pallete.whiteColor),
      label: Text(
        labelText,
        style: const TextStyle(color: Pallete.whiteColor, fontSize: 16),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: horizontalPadding,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Pallete.borderColor, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
