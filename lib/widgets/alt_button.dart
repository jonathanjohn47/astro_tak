import 'package:astro_tak/core/app_colors.dart';
import 'package:flutter/material.dart';

class AltButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AltButton({Key? key, required this.text, required this.onPressed})
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
            color: AppColors.secondaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
