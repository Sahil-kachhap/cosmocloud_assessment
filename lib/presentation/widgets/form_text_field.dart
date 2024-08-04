import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.icon,
  });

  final TextEditingController controller;
  final String labelText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        prefixIcon: icon != null ? Icon(icon): null,
        prefixIconColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(10.0))
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your ${labelText.toLowerCase()}";
        } 
        return null;
      },
    );
  }
}
