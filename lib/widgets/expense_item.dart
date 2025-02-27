import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  final String category;
  final double amount;
  final DateTime date;
  final String description;

  const ExpenseItem({
    Key? key,
    required this.category,
    required this.amount,
    required this.date,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category),
      subtitle: Text(description),
      trailing: Text('\$${amount.toStringAsFixed(2)}'),
    );
  }
}