import 'package:astro_tak/core/app_colors.dart';
import 'package:astro_tak/core/app_constants.dart';
import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final double? radius;
  final double? elevation;
  final IconData? icon;

  const StandardButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color,
      this.textColor,
      this.radius,
      this.elevation,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        onPressed();
      },
      icon: icon != null
          ? Icon(
              icon,
              color: textColor ?? Colors.white,
            )
          : null,
      label: Text(
        text,
        style: TextStyle(color: textColor ?? Colors.white),
      ),
      backgroundColor: color ?? AppColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(radius ?? AppConstants.borderRadius),
      ),
      elevation: elevation ?? 2,
    );
  }
}
