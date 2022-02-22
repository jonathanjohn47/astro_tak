import 'package:astro_tak/core/app_colors.dart';
import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final double? radius;
  final double? elevation;

  const StandardButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color,
      this.textColor,
      this.radius,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        onPressed();
      },
      label: Text(
        text,
        style: TextStyle(color: textColor ?? Colors.white),
      ),
      backgroundColor: color ?? AppColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 6),
      ),
      elevation: elevation ?? 2,
    );
  }
}
