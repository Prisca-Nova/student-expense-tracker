import 'package:hive_flutter/hive_flutter.dart';
import '../models/budget.dart';
import '../models/category.dart';
import '../models/expense.dart';
import '../models/saving_goal.dart';

class DbHelper {
  
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BudgetAdapter()); // Generated adapter
    Hive.registerAdapter(CategoryAdapter()); // Generated adapter
    Hive.registerAdapter(ExpenseAdapter()); // Generated adapter
    Hive.registerAdapter(SavingGoalAdapter()); // Generated adapter
    await Hive.openBox<Budget>('budgets');
    await Hive.openBox<Category>('categories');
    await Hive.openBox<Expense>('expenses');
    await Hive.openBox<SavingGoal>('savings');
    await Hive.openBox('settings');
  }

  static Box<Budget> get budgetBox => Hive.box<Budget>('budgets');
  static Box<Category> get categoryBox => Hive.box<Category>('categories');
  static Box<Expense> get expenseBox => Hive.box<Expense>('expenses');
  static Box<SavingGoal> get savingsBox => Hive.box<SavingGoal>('savings');
  static Box get settingsBox => Hive.box('settings');
}