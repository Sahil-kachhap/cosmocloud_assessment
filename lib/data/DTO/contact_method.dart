enum Method { email, phone }

class ContactMethod {
  final Method method;
  final String value;

  ContactMethod({required this.method, required this.value});

  factory ContactMethod.fromJson(Map<String, dynamic> json) {
    return ContactMethod(
        method: json['contact_method'] == "Email" ? Method.email : Method.phone,
        value: json['value']);
  }

  Map<String, dynamic> toJson() {
    return {
      'contact_method': method.name,
      'value': value,
    };
  }
}
