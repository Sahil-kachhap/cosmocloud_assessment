part of 'employee_bloc.dart';

sealed class EmployeeState {}

final class EmployeeInitial extends EmployeeState {}

final class Loading extends EmployeeState {}

final class LoadMore extends EmployeeState {}

final class EmployeeCreated extends EmployeeState {
  final String message;

  EmployeeCreated({required this.message});
}

final class EmployeeListLoaded extends EmployeeState {
  final List<EmployeeEntity> employees;

  EmployeeListLoaded({required this.employees});
}

final class EmployeeProfileLoaded extends EmployeeState {
  final Employee employee;

  EmployeeProfileLoaded({required this.employee});
}

final class ErrorState extends EmployeeState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}


final class NoMoreEmployeeFound extends EmployeeState {}

final class EmployeeDeleted extends EmployeeState {
  final String message;

  EmployeeDeleted({required this.message});
}
 