import 'package:employee_management_system/data/DTO/employee.dart';
import 'package:employee_management_system/data/data_sources/remote_data_source.dart';

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

  Future<List<Employee>> fetchEmployeeList(int offset) async {
    try {
      List<Employee> employees = await remoteDataSource.fetchEmployees(offset);
      return employees;
    } catch (error) {
      throw error.toString();
    }
  }
}
