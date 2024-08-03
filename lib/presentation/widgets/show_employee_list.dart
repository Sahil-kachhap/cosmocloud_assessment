import 'package:employee_management_system/domain/entity/employee_entity.dart';
import 'package:employee_management_system/presentation/widgets/employee_tile.dart';
import 'package:employee_management_system/utils/device_utils.dart';
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
        itemCount: employees.length+1,
        itemBuilder: (context, index) {
          if(index >= employees.length){
            return DeviceUtils.showCircularProgressIndicator();
          }

          return EmployeeTile(name: employees[index].name, id: employees[index].id,);
        });
  }
}