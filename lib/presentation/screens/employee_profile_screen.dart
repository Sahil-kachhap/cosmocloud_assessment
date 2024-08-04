import 'dart:developer';

import 'package:employee_management_system/presentation/bloc/employee/employee_bloc.dart';
import 'package:employee_management_system/presentation/widgets/show_contact_methods.dart';
import 'package:employee_management_system/utils/constants.dart';
import 'package:employee_management_system/utils/device_utils.dart';
import 'package:employee_management_system/utils/texts.dart';
import 'package:employee_management_system/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeProfile extends StatefulWidget {
  final String employeeId;

  const EmployeeProfile({super.key, required this.employeeId});

  @override
  State<EmployeeProfile> createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  @override
  void initState() {
    context.read<EmployeeBloc>().add(FetchEmployeeProfileEvent(employeeId: widget.employeeId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(Constants.backgroundDarkThemeColor),
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.read<EmployeeBloc>().add(ScreenTransitionEvent());
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
        title: const Text("Employee Profile", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(Constants.backgroundDarkThemeColor),
      ),
      body: BlocConsumer<EmployeeBloc, EmployeeState>(
        buildWhen: (previous, current) {
          return (current is EmployeeProfileLoaded);
        },
        listener: (context, state) {
          log(state.toString());
          if (state is ErrorState) {
            DeviceUtils.showSnackBar(context, state.errorMessage, Colors.red);
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            return DeviceUtils.showCircularProgressIndicator();
          }

          if (state is EmployeeProfileLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Employee Name", style: TThemes.largeTitleWithBoldFontStyle(context),),
                  Text(state.employee.name, style: const TextStyle(fontSize: 18, color: Colors.white),),
                  const SizedBox(height: 16.0,),
                  Text("Address ", style: TThemes.largeTitleWithBoldFontStyle(context),),
                  Text(TText.formatAddress(state.employee.address), style: const TextStyle(fontSize: 18, color: Colors.white),),
                  const SizedBox(height: 16.0,),
                  Text("Contact ", style: TThemes.largeTitleWithBoldFontStyle(context),),
                  Expanded(
                    child: ShowEmployeeContactMethods(contactMethods: state.employee.contactMethods,),
                  )
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
