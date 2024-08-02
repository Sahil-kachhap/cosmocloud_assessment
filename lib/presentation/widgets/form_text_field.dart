import 'package:employee_management_system/data/DTO/contact_method.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.icon,
    this.contactMethods,
  });

  final TextEditingController controller;
  final String labelText;
  final IconData? icon;
  final List<ContactMethod>? contactMethods;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (contactMethods == null && value!.isEmpty) {
          return "Please enter your ${labelText.toLowerCase()}";
        } else if(contactMethods != null && contactMethods!.isEmpty){
          return "Add atleast 1 contact method";
        }

        return null;
      },
    );
  }
}
