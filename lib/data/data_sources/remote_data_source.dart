import 'dart:convert';
import 'dart:developer';

import 'package:employee_management_system/data/DTO/employee.dart';
import 'package:http/http.dart' as http;
import 'package:employee_management_system/utils/constants.dart';

class RemoteDataSource {
  Future<String> createEmployee(Employee employee) async {
    try {
      final String url = Constants.baseUrl + Constants.createOrListEmployeesEndpoint(false);
      final headers = Constants.apiHeaders();
      final body = jsonEncode(employee.toJson());
      
      final response = await http.post(Uri.parse(url), headers: headers, body: body);
      if(response.statusCode == 201){
        log("employee created succesfully", time: DateTime.now(), name: "Create Employee Api");
        return Constants.onSuccessfullEmployeeCreationResponse;
      }else{
        throw response.body.toString();
      }
    } catch (error) {
      log(error.toString(), time: DateTime.now(), name: "Create Employee Api Request");
      throw Constants.onEmployeeCreationFailureResponse;
    }
  }

  Future<List<Employee>> fetchEmployees(int offset) async{
    try {
      final String url = Constants.baseUrl + Constants.createOrListEmployeesEndpoint(true, limit: Constants.limit, offset: offset);
      final headers = Constants.apiHeaders();
      final response = await http.get(Uri.parse(url), headers: headers);

      if(response.statusCode == 200){
        final decodedResponseBody = jsonDecode(response.body)['data'];
        log("Employees Data Received", name: "Fetch Employee List");
        return List<Employee>.from(decodedResponseBody.map((employee) => Employee.fromJson(employee)));
      } else {
        throw response.body.toString();
      }
      
    } catch(error) {
      log(error.toString(), name: "Fetch Employee List");
      throw error.toString();
    }
  }

  Future<Employee> fetchEmployeeProfile(String employeeId) async{
    try {
      String url = Constants.baseUrl + Constants.fetchEmployeeDetailsEndpoint(employeeId);
      final headers = Constants.apiHeaders();
      final response = await http.get(Uri.parse(url), headers: headers);
      if(response.statusCode == 200){
        return Employee.fromJson(jsonDecode(response.body));
      }else{
        throw Exception(response.body.toString());
      }
    } catch(error) {
      throw Exception(error.toString());
    }
  }

    Future<String> deleteEmployee(String employeeId) async{
    try {
      String url = Constants.baseUrl + Constants.deleteEmployeeEndpoint(employeeId);
      final headers = Constants.apiHeaders();
      final response = await http.delete(Uri.parse(url), headers: headers, body: jsonEncode({}));
      if(response.statusCode == 200){
        return "Employee removed successfully";
      }else{
        log(response.body.toString());
        throw Exception("An unknown exception occurred.");
      }
    } catch(error) {
      throw Exception(error.toString());
    }
  }
}
