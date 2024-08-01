import 'package:employee_management_system/data/DTO/employee.dart';
import 'package:employee_management_system/domain/usecase/fetch_employees.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final FetchEmployeeList fetchEmployeeList = FetchEmployeeList();
  int offset = 0;
  EmployeeBloc() : super(EmployeeInitial()) {
    on<EmployeeEvent>((event, emit) async{
      if(event is FetchEmployeeListEvent){
        emit(Loading());
        try{
         List<Employee> employees = await fetchEmployeeList.fetchEmployees(offset);
         emit(EmployeeListLoaded(employees: employees));
        } catch(error){
          emit(ErrorState(errorMessage: error.toString()));
        }
      }
    });
  }
}
