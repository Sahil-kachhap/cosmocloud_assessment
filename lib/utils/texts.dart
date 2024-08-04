import 'package:employee_management_system/data/DTO/address.dart';

class TText{
  static const String employeeListScreenTitle = "Employee List";


  static String formatAddress(Address address) => "${address.line1}, ${address.city}, ${address.country}-${address.zipcode}";
}