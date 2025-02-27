import 'package:hive/hive.dart';

part 'expense.g.dart'; // Generated file

@HiveType(typeId: 0) // Unique typeId
class Expense {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String categoryId;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String description;

  Expense({
    required this.id,
    required this.categoryId,
    required this.amount,
    required this.date,
    required this.description,
  });
}