import 'package:hive_flutter/hive_flutter.dart';
import '../models/budget.dart';
import '../models/category.dart';
import '../models/expense.dart';
import '../models/saving_goal.dart';

class DbHelper {
  static bool _initialized = false;
  
  static Future<void> init() async {
    if (_initialized) return; // Prevent multiple initializations
    
    await Hive.initFlutter();
    
    // Register adapters only if they're not already registered
    if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(BudgetAdapter());
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(CategoryAdapter());
    if (!Hive.isAdapterRegistered(2)) Hive.registerAdapter(ExpenseAdapter());
    if (!Hive.isAdapterRegistered(3)) Hive.registerAdapter(SavingGoalAdapter());
    
    await Hive.openBox<Budget>('budgets');
    await Hive.openBox<Category>('categories');
    await Hive.openBox<Expense>('expenses');
    await Hive.openBox<SavingGoal>('savings');
    await Hive.openBox('settings');
    
    _initialized = true;
  }

  static Box<Budget> get budgetBox => Hive.box<Budget>('budgets');
  static Box<Category> get categoryBox => Hive.box<Category>('categories');
  static Box<Expense> get expenseBox => Hive.box<Expense>('expenses');
  static Box<SavingGoal> get savingsBox => Hive.box<SavingGoal>('savings');
  static Box get settingsBox => Hive.box('settings');
}