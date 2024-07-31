import 'package:employee_management_system/data/DTO/address.dart';
import 'package:employee_management_system/data/DTO/contact_method.dart';

class Employee {
  final String? id;
  final String name;
  final Address address;
  final List<ContactMethod> contactMethods;

  Employee(
      {this.id,
      required this.name,
      required this.address,
      required this.contactMethods});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json['_id'],
        name: json['name'],
        address: Address.fromJson(json['address']),
        contactMethods: json['contact_methods'].map((method) => ContactMethod.fromJson(method)));
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address.toJson(),
      'contact_methods': contactMethods.map((method) => method.toJson()).toList(),
    };
  }
}
