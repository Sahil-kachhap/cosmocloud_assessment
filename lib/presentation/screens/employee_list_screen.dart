import 'package:employee_management_system/presentation/bloc/employee/employee_bloc.dart';
import 'package:employee_management_system/presentation/screens/employee_form_screen.dart';
import 'package:employee_management_system/presentation/widgets/show_employee_list.dart';
import 'package:employee_management_system/utils/constants.dart';
import 'package:employee_management_system/utils/device_utils.dart';
import 'package:employee_management_system/utils/texts.dart';
import 'package:employee_management_system/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        context.read<EmployeeBloc>().add(FetchEmployeeListEvent());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(Constants.backgroundDarkThemeColor),
      appBar: AppBar(
        title: Text(
          TText.employeeListScreenTitle,
          style: TThemes.appBarTextStyling,
        ),
        backgroundColor: const Color(Constants.backgroundDarkThemeColor),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EmployeeFormScreen()),
          );
        },
        backgroundColor: const Color(Constants.backgroundLightThemeColor),
        child: const Icon(Icons.add, color: Colors.white, size: 30,),
      ),
      body:BlocConsumer<EmployeeBloc, EmployeeState>(
       buildWhen: (previous, current) {
         return (current is EmployeeListLoaded || current is Loading); 
       },
       builder: (context, state) {
        if (state is Loading) {
          return DeviceUtils.showCircularProgressIndicator();
        } else if (state is EmployeeListLoaded) {
          return state.employees.isNotEmpty? ShowEmployeeList(scrollController: scrollController, employees: state.employees,): Center(child: Text("No Employee Exists Yet", style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),),);
        } 

        return const SizedBox();
      }, listener: (context, state) {
        if(state is LoadMore){
          DeviceUtils.showSnackBar(context, "Retrieving Next Page...", Colors.green);
        }

        if(state is EmployeeDeleted){
          DeviceUtils.showSnackBar(context, state.message, Colors.red);
        }

        if(state is NoMoreEmployeeFound){
          DeviceUtils.showSnackBar(context, "That's all of us . No more data exists 🎉", Colors.amber);
        }
        if (state is ErrorState) {
          DeviceUtils.showSnackBar(context, state.errorMessage, Colors.red);
        }
      }),
    );
  }
}


