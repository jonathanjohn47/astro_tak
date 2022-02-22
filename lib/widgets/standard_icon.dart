import 'package:astro_tak/core/app_colors.dart';
import 'package:flutter/material.dart';

class StandardIconButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size;
  final Function()? onPressed;

  const StandardIconButton(
      {Key? key, required this.icon, this.color, this.size, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          if (onPressed != null) onPressed!();
        },
        icon: Icon(icon, color: color ?? AppColors.secondaryColor, size: size));
  }
}
