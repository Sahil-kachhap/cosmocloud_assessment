import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  // Base Url
  static const String baseUrl =
      "https://free-ap-south-1.cosmocloud.io/development/api";

  //Api Endpoints
  // endpoint to create a employee or list all employees
  static String createOrListEmployeesEndpoint(bool hasQueryParams,
          {int? limit, int? offset}) =>
      hasQueryParams ? "/employees?limit=$limit&offset=$offset" : "/employees";
  // endpoint to fetch a specific employee details
  static String fetchEmployeeDetailsEndpoint(String employeeId) =>
      "/employees/$employeeId";

  // Api Headers
  static Map<String, String> apiHeaders() => {
        'Content-Type': 'application/json',
        'projectId': dotenv.env['PROJECTID']!,
        'environmentId': dotenv.env['ENVIRONMENTID']!
      };

  // Custom Api Response
  static const onSuccessfullEmployeeCreationResponse =
      "Employee added successfully";
  static const onEmployeeCreationFailureResponse =
      "Error occurred while adding the employee";

  // Api Query Parameters
  static const limit = 10;

  
  // themes
  static const int backgroundDarkThemeColor = 0xff2A203F; 
  static const int backgroundLightThemeColor = 0xff9853B8;
 }
