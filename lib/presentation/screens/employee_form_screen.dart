import "package:employee_management_system/data/DTO/contact_method.dart";
import "package:employee_management_system/presentation/bloc/employee/employee_bloc.dart";
import "package:employee_management_system/presentation/widgets/form_text_field.dart";
import "package:employee_management_system/utils/constants.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class EmployeeFormScreen extends StatefulWidget {
  const EmployeeFormScreen({super.key});

  @override
  State<EmployeeFormScreen> createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends State<EmployeeFormScreen> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // A key for managing the form
  var selectedValue = "";
  List<String> contactChannels = ["Email", "Phone"];
  Map<String, String> contactMethods = {};

  // text form field controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressLineController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final TextEditingController contactMethodController = TextEditingController();

  List<ContactMethod> methods = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add Employee"),
      ),
      body: BlocListener<EmployeeBloc, EmployeeState>(
        listener: (context, state) {
           if(state is EmployeeCreated){
             Constants.showSnackBar(context, state.message, Colors.green);
             Navigator.pop(context);
           } else if(state is ErrorState){
             Constants.showSnackBar(context, state.errorMessage, Colors.red);
           }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormTextField(controller: nameController, labelText: "Name", icon: Icons.person_2_outlined,),
                const SizedBox(height: 16.0,),
                FormTextField(controller: addressLineController, labelText: "Address", icon: Icons.apartment_outlined,),
                const SizedBox(height: 16.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: FormTextField(controller: cityController,labelText: "City",icon: Icons.location_city,),
                    ),
                    const SizedBox(width: 16.0,),
                    Expanded(
                      child: FormTextField(controller: countryController,labelText: "Country",icon: Icons.place,),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0,),
                Flexible(
                  fit: FlexFit.loose,
                  child: FormTextField(controller: zipcodeController, labelText: "zipcode", icon: Icons.pin,),
                ),
                const SizedBox(height: 16.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Contact Methods",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    IconButton(
                      onPressed: () {
                        ContactMethod method = ContactMethod(method: selectedValue == "EMAIL" ? Method.email: Method.phone, value: contactMethodController.text);
                        methods.add(method);
                        contactMethodController.clear();
                        setState(() {});
                      },
                      icon: const Row(
                        children: [
                          Icon(Icons.add),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: DropdownButtonFormField<String>(
                          items: contactChannels.map((channel) => DropdownMenuItem(value: channel.toUpperCase(), child: Text(channel))).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Email/Phone",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(width: 1, color: Colors.purple)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select a contact method';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: FormTextField(controller: contactMethodController,labelText: "Value",contactMethods: methods),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 5,
                  children: methods.map((e) => Chip(
                          label: Text(e.value),
                          avatar: e.method == Method.email
                              ? const Icon(Icons.mail_outline)
                              : const Icon(Icons.phone),
                        ),
                      ).toList(),
                ),
                const SizedBox(height: 32.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        
                        context.read<EmployeeBloc>().add(
                              CreateEmployeeEvent(
                                name: nameController.text,
                                line1: addressLineController.text,
                                city: cityController.text,
                                country: countryController.text,
                                zipcode: zipcodeController.text,
                                contactMethods: methods,
                              ),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
