part of 'employee_bloc.dart';

sealed class EmployeeEvent {}

final class FetchEmployeeListEvent extends EmployeeEvent {}

final class CreateEmployeeEvent extends EmployeeEvent {
  final String name;
  final String line1;
  final String city;
  final String country;
  final String zipcode;
  final List<ContactMethod> contactMethods;

  CreateEmployeeEvent({required this.name, required this.line1, required this.city, required this.country, required this.zipcode, required this.contactMethods});
}

final class FetchEmployeeProfileEvent extends EmployeeEvent {
  final String employeeId;

  FetchEmployeeProfileEvent({required this.employeeId});
}

final class ScreenTransitionEvent extends EmployeeEvent{}

final class DeleteEmployee extends EmployeeEvent {
  final String employeeId;

  DeleteEmployee({required this.employeeId});
}