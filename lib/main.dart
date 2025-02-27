import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/budget.dart'; // Import your models
import 'models/saving_goal.dart'; // Import your models
import 'screens/auth_screen.dart'; // Import your initial screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  await Hive.initFlutter(); // Initialize Hive
 Hive.registerAdapter(BudgetAdapter()); // Register your adapters
  Hive.registerAdapter(SavingGoalAdapter()); // Register your adapters
  await Hive.openBox<Budget>('budgets'); // Open your boxes
  await Hive.openBox<SavingGoal>('savings'); // Open your boxes
  await Hive.openBox('settings'); // Open your boxes
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
      home: const AuthScreen(), // Set your initial screen
    );
  }
}