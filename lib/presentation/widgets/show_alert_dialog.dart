import 'package:employee_management_system/presentation/bloc/employee/employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowDialogToConfirmEmployeeDeletion extends StatelessWidget {
  const  ShowDialogToConfirmEmployeeDeletion({
    super.key,
    required this.name,
    required this.id
  });

  final String name;
  final String id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("Are you sure you want to remove $name?"),
      actions: <Widget>[
        ElevatedButton(
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text(
            "Delete",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            context.read<EmployeeBloc>().add(DeleteEmployee(employeeId: id));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}