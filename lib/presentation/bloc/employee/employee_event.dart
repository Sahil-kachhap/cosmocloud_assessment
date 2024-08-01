part of 'employee_bloc.dart';

sealed class EmployeeEvent {}

final class FetchEmployeeListEvent extends EmployeeEvent {}

final class CreateEmployeeEvent extends EmployeeEvent {
  final String name;
  final String line1;
  final String city;
  final String country;
  final String zipcode;
  final Map<String, String> contactMethods;

  CreateEmployeeEvent({required this.name, required this.line1, required this.city, required this.country, required this.zipcode, required this.contactMethods});
}

final class FetchEmployeeProfile extends EmployeeEvent {
  final String employeeId;

  FetchEmployeeProfile({required this.employeeId});
}
