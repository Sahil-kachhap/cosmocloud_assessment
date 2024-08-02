import 'package:employee_management_system/data/DTO/address.dart';
import 'package:employee_management_system/data/DTO/contact_method.dart';
import 'package:employee_management_system/data/DTO/employee.dart';
import 'package:employee_management_system/domain/entity/employee_entity.dart';
import 'package:employee_management_system/domain/usecase/create_employee.dart';
import 'package:employee_management_system/domain/usecase/fetch_employees.dart';
import 'package:employee_management_system/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final FetchEmployeeList fetchEmployeeList = FetchEmployeeList();
  final CreateEmployee createEmployee = CreateEmployee();
  int page = 0;
  List<EmployeeEntity> employees = [];

  EmployeeBloc() : super(EmployeeInitial()) {
    on<FetchEmployeeListEvent>((event, emit) async {
      emit(Loading());
      try {
        int offset = page * Constants.limit;
        List<EmployeeEntity> employees =
            await fetchEmployeeList.fetchEmployees(offset);
        emit(EmployeeListLoaded(employees: employees));
      } catch (error) {
        emit(ErrorState(errorMessage: error.toString()));
      }
    });
    on<FetchEmployeeProfileEvent>((event, emit) async {
      emit(Loading());
      try {
        Employee employee =
            await fetchEmployeeList.fetchProfile(event.employeeId);
        emit(EmployeeProfileLoaded(employee: employee));
      } catch (error) {
        emit(ErrorState(errorMessage: error.toString()));
      }
    });
    on<CreateEmployeeEvent>((event, emit) async {
      emit(Loading());
      try {
        Employee employee = Employee(
          name: event.name,
          address: Address(
            line1: event.line1,
            city: event.city,
            country: event.country,
            zipcode: event.zipcode,
          ),
          contactMethods: event.contactMethods,
        );
        String response = await createEmployee.addEmployee(employee);
        emit(EmployeeCreated(message: response));
      } catch (error) {
        emit(ErrorState(errorMessage: error.toString()));
      }
    });
  }
}
