import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/budget.dart';
import '../utils/db_helper.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  BudgetScreenState createState() => BudgetScreenState();
}

class BudgetScreenState extends State<BudgetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _budgetController = TextEditingController();

  void _saveBudget() {
    if (_formKey.currentState!.validate()) {
      final budget = Budget(
        amount: double.parse(_budgetController.text),
        date: DateTime.now(),
      );
      DbHelper.budgetBox.add(budget);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Budget saved successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _budgetController,
                        decoration: const InputDecoration(
                          labelText: 'Monthly Budget',
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a budget';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _saveBudget,
                        child: const Text('Save Budget'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ValueListenableBuilder(
              valueListenable: DbHelper.budgetBox.listenable(),
              builder: (context, Box<Budget> box, _) {
                if (box.isEmpty) {
                  return const Center(child: Text('No budget set.'));
                }
                final budget = box.getAt(0)!;
                return Column(
                  children: [
                    Text(
                      'Current Budget: \$${budget.amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: 0.5, // Replace with actual usage
                      backgroundColor: Colors.grey[200],
                      color: Colors.blue,
                      minHeight: 12,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}