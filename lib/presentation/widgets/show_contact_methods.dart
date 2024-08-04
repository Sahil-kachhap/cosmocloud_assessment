import 'package:employee_management_system/data/DTO/contact_method.dart';
import 'package:flutter/material.dart';

class ShowEmployeeContactMethods extends StatelessWidget {
  const ShowEmployeeContactMethods({
    super.key,
    required this.contactMethods
  });

  final List<ContactMethod> contactMethods;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: contactMethods.length,
        itemBuilder: (context, index) {
          return Text(contactMethods[index].value, style: const TextStyle(color: Colors.white),);
    });
  }
}