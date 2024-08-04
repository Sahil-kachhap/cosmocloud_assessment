import 'package:employee_management_system/data/DTO/contact_method.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.textInputType,
    this.icon,
    this.isContactMethod = false,
    this.methods
  });

  final TextEditingController controller;
  final String labelText;
  final IconData? icon;
  final TextInputType? textInputType;
  final bool isContactMethod;
  final List<ContactMethod>? methods;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
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
        if (!isContactMethod && value!.isEmpty) {
          return "Please enter your ${labelText.toLowerCase()}";
        } 

        if(isContactMethod && methods!.isEmpty){
          return "Please enter atleast one contact detail to proceed";
        }
        return null;
      },
    );
  }
}
