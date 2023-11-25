import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled({
    super.key,
    required this.title,
    required this.controller,
    this.validator,
    this.maxLines = 1,
  });

  int maxLines;
  final String title;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
      ),
    );
  }
}
