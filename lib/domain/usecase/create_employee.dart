import 'package:employee_management_system/data/DTO/employee.dart';
import 'package:employee_management_system/data/repository/employee_repository.dart';

class CreateEmployee {
  final EmployeeRepository _employeeRepository = EmployeeRepository();

  Future<String> addEmployee(Employee employee) async{
    try{
      String response = await _employeeRepository.createEmployee(employee);
      return response;
    }catch(error){
      throw error.toString();
    }
  } 
}