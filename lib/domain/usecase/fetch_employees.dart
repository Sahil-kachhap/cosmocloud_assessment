import 'package:employee_management_system/data/DTO/employee.dart';
import 'package:employee_management_system/data/repository/employee_repository.dart';
import 'package:employee_management_system/domain/entity/employee_entity.dart';

class FetchEmployeeList{
  final EmployeeRepository _employeeRepository = EmployeeRepository();


  Future<List<EmployeeEntity>> fetchEmployees(int offset) async{
    try {
      List<EmployeeEntity> employees = await _employeeRepository.fetchEmployeeList(offset);
      return employees;
    } catch(error){
      throw error.toString();
    }
  }

  Future<Employee> fetchProfile(String employeeId) async{
    try {
      Employee employee = await _employeeRepository.fetchEmployeeProfile(employeeId);
      return employee;
    } catch(error){
      throw error.toString();
    }
  }
}