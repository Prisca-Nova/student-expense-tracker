import 'package:flutter/material.dart';

class BudgetProgress extends StatelessWidget {
  final double budget;
  final double spent;
  final double remaining;

  const BudgetProgress({
    Key? key,
    required this.budget,
    required this.spent,
    required this.remaining,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: spent / budget,
          backgroundColor: Colors.grey[200],
          color: Colors.blue,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Spent: \$${spent.toStringAsFixed(2)}'),
            Text('Remaining: \$${remaining.toStringAsFixed(2)}'),
          ],
        ),
      ],
    );
  }
}