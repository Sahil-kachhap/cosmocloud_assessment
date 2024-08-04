import 'package:employee_management_system/data/repository/employee_repository.dart';

class DeleteEmployeeUsecase {
    final EmployeeRepository _employeeRepository = EmployeeRepository();
    
    Future<String> deleteEmployeeProfile(String employeeId) async{
       try {
         String response = await _employeeRepository.deleteEmployeeProfile(employeeId);
         return response;
       } catch(error){
         throw error.toString();
       }
    }
}