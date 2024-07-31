import 'dart:convert';
import 'dart:developer';

import 'package:employee_management_system/data/DTO/employee.dart';
import 'package:http/http.dart' as http;
import 'package:employee_management_system/utils/constants.dart';

class RemoteDataSource {
  Future<String> createEmployee(Employee employee) async {
    try {
      const String url = Constants.baseUrl + Constants.createOrListEmployeesEndpoint;
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
}
