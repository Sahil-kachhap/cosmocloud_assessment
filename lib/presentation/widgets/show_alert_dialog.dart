import 'package:flutter/material.dart';

class ShowDialogToConfirmEmployeeDeletion extends StatelessWidget {
  const ShowDialogToConfirmEmployeeDeletion({
    super.key,
    required this.name,
  });

  final String name;

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
            // TODO: Add event to delete employee with given ID
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}