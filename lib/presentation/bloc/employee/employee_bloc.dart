import 'package:employee_management_system/data/DTO/employee.dart';
import 'package:employee_management_system/domain/entity/employee_entity.dart';
import 'package:employee_management_system/domain/usecase/fetch_employees.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final FetchEmployeeList fetchEmployeeList = FetchEmployeeList();
  int offset = 0;
  EmployeeBloc() : super(EmployeeInitial()) {
    on<FetchEmployeeListEvent>((event, emit) async {
      emit(Loading());
      try {
        List<EmployeeEntity> employees = await fetchEmployeeList.fetchEmployees(offset);
        emit(EmployeeListLoaded(employees: employees));
      } catch (error) {
        emit(ErrorState(errorMessage: error.toString()));
      }
    });
    on<FetchEmployeeProfileEvent>((event, emit) async{
      emit(Loading());
      try{
        Employee employee = await fetchEmployeeList.fetchProfile(event.employeeId);
        emit(EmployeeProfileLoaded(employee: employee));
      }catch(error){
        emit(ErrorState(errorMessage: error.toString()));
      }
    });
  }
}
