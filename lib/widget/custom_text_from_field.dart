import 'package:chat_app/colors/color_app.dart';
import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.hintText,
    this.obscureText,
    required this.prefixIcon,
    required this.validator,
    this.suffixIcon,
    this.onPressed,
  });
  final bool? obscureText;
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: AppColor.primary,
      obscureText: obscureText ?? false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: suffixIcon == null
            ? const SizedBox()
            : IconButton(onPressed: onPressed, icon: Icon(suffixIcon)),
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
