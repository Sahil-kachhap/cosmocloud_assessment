import 'package:employee_management_system/domain/entity/employee_entity.dart';
import 'package:employee_management_system/presentation/widgets/employee_tile.dart';
import 'package:flutter/material.dart';

class ShowEmployeeList extends StatelessWidget {
  const ShowEmployeeList({
    super.key,
    required this.scrollController,
    required this.employees
  });

  final ScrollController scrollController;
  final List<EmployeeEntity> employees;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        shrinkWrap: false,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: employees.length,
        itemBuilder: (context, index) {
          return EmployeeTile(name: employees[index].name, id: employees[index].id,);
        });
  }
}