import 'package:astro_tak/core/app_constants.dart';
import 'package:flutter/material.dart';

class TextEntryField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? validator;
  final String? validatorText;
  final Function(String)? onChanged;

  const TextEntryField(
      {Key? key,
      required this.labelText,
      required this.controller,
      this.keyboardType,
      this.obscureText,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.validatorText,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
      ),
      validator: (value) {
        if (validator != null) {
          return validator!(value!);
        }
        return null;
      },
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
    );
  }
}
