import 'package:employee_management_system/presentation/screens/employee_profile_screen.dart';
import 'package:employee_management_system/presentation/widgets/employee_tile_dismiss_container.dart';
import 'package:employee_management_system/presentation/widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';

class EmployeeTile extends StatelessWidget {
  const EmployeeTile({
    required this.name,
    required this.id,
    super.key,
  });

  final String name;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id),
      background: Container(),
      secondaryBackground: const EmployeeTileDismissContainer(),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          final bool res = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return ShowDialogToConfirmEmployeeDeletion(name: name);
              });
          return res;
        }
        return null;
      },
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
        subtitle: Text(
          "Employee ID: $id",
          style: const TextStyle(color: Colors.white),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmployeeProfile(
                employeeId: id,
              ),
            ),
          );
        },
      ),
    );
  }
}

