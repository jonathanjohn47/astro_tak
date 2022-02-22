import 'package:astro_tak/core/app_colors.dart';
import 'package:astro_tak/core/app_constants.dart';
import 'package:flutter/material.dart';

class AltButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? backGroundColor;

  const AltButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color,
      this.backGroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color ?? AppColors.secondaryColor,
            width: 2,
          ),
          color: backGroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Text(
            text,
            style: TextStyle(
              color: color ?? AppColors.secondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
