import 'package:employee_management_system/data/DTO/employee.dart';
import 'package:employee_management_system/data/data_sources/remote_data_source.dart';
import 'package:employee_management_system/domain/entity/employee_entity.dart';

class EmployeeRepository {
  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<String> createEmployee(Employee employee) async {
    try {
      String response = await remoteDataSource.createEmployee(employee);
      return response;
    } catch (error) {
      throw error.toString();
    }
  }

  Future<List<EmployeeEntity>> fetchEmployeeList(int offset) async {
    try {
      List<Employee> employees = await remoteDataSource.fetchEmployees(offset);
      List<EmployeeEntity> entities = employees.map((employee) => EmployeeEntity(name: employee.name, id: employee.id!)).toList(); 
      return entities;
    } catch (error) {
      throw error.toString();
    }
  }

  Future<Employee> fetchEmployeeProfile(String employeeId) async{
    try {
      Employee employee = await remoteDataSource.fetchEmployeeProfile(employeeId);
      return employee;
    } catch(error){
      throw Exception(error.toString());
    }
  }

  Future<String> deleteEmployeeProfile(String employeeId) async{
    try {
      String response = await remoteDataSource.deleteEmployee(employeeId);
      return response;
    } catch(error){
      throw Exception(error.toString());
    }
  }
}
