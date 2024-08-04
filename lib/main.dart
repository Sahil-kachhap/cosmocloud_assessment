import 'package:employee_management_system/presentation/bloc/employee/employee_bloc.dart';
import 'package:employee_management_system/presentation/screens/employee_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async{
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeBloc()..add(FetchEmployeeListEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Employee Management System',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: MaterialStateProperty.all<Color>(Colors.white),),),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const EmployeeListScreen(),
      ),
    );
  }
}