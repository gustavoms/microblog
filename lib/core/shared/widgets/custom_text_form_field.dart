import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    this.validator,
    this.obscureText = false,
    this.maxLength,
    this.keyboardType,
    this.maxLines,
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines ?? 1,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      controller: textEditingController,
      validator: validator,
      obscureText: obscureText,
    );
  }
}
