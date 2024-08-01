import 'package:employee_management_system/data/DTO/employee.dart';
import 'package:employee_management_system/data/repository/employee_repository.dart';

class FetchEmployeeList{
  final EmployeeRepository employeeRepository = EmployeeRepository();


  Future<List<Employee>> fetchEmployees(int offset) async{
    try {
      List<Employee> employees = await employeeRepository.fetchEmployeeList(offset);
      return employees;
    } catch(error){
      throw error.toString();
    }
  }
}