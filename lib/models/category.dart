import 'package:hive/hive.dart';

part 'category.g.dart'; // Generated file

@HiveType(typeId: 1) // Unique typeId for Category
class Category {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int color;

  @HiveField(3)
  final int icon;

  Category({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
  });
}