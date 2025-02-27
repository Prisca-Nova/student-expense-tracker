import 'package:hive/hive.dart';

part 'saving_goal.g.dart'; // Generated file

@HiveType(typeId: 3) // Unique typeId for SavingGoal
class SavingGoal {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double target;

  @HiveField(3)
  final double current;

  @HiveField(4)
  final DateTime targetDate;

  @HiveField(5)
  final DateTime created;

  SavingGoal({
    required this.id,
    required this.name,
    required this.target,
    required this.current,
    required this.targetDate,
    required this.created,
  });
}