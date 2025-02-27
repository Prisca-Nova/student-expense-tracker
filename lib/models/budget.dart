import 'package:hive/hive.dart';

part 'budget.g.dart'; // Generated file

@HiveType(typeId: 0) // Unique typeId for Budget
class Budget {
  @HiveField(0)
  final double amount;

  @HiveField(1)
  final DateTime date;

  Budget({
    required this.amount,
    required this.date,
  });
}