import 'package:employee_management_system/presentation/bloc/employee/employee_bloc.dart';
import 'package:employee_management_system/presentation/screens/employee_form_screen.dart';
import 'package:employee_management_system/presentation/screens/employee_profile_screen.dart';
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
      backgroundColor: const Color(0xff2A203F),
      appBar: AppBar(
        title: const Text(
          "Employee List",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.white),
        ),
        backgroundColor: const Color(0xff2A203F),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EmployeeFormScreen()),
          );
        },
        backgroundColor: const Color(0xff9853B8),
        child: const Icon(Icons.add, color: Colors.white, size: 30,),
      ),
      body:BlocConsumer<EmployeeBloc, EmployeeState>(
       buildWhen: (previous, current) {
         return (current is EmployeeListLoaded); 
       },
       builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is EmployeeListLoaded) {
          return ListView.builder(
              controller: scrollController,
              shrinkWrap: false,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.employees.length + 1,
              itemBuilder: (context, index) {
                if(index >= state.employees.length){
                  return const Center(child: CircularProgressIndicator());
                }
                return ListTile(
                  title: Text(state.employees[index].name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),),
                  subtitle: Text("Employee ID: ${state.employees[index].id}", style: const TextStyle(color: Colors.white),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmployeeProfile(
                          employeeId: state.employees[index].id,
                        ),
                      ),
                    );
                  },
                );
              });
        }

        return Container();
      }, listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      }),
    );
  }
}
