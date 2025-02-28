import 'package:flutter/material.dart';
import 'package:smart_expense_tracker/screens/expense_form_screen.dart';
import 'screens/auth_screen.dart';
import 'utils/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.init(); // Initialize Hive and open boxes
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Finance Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
    '/': (context) => AuthScreen(),
    '/expense_form': (context) => ExpenseFormScreen(),
    // other routes...
  },
    );
  }
}