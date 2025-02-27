import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/saving_goal.dart';
import '../utils/db_helper.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({Key? key}) : super(key: key);

  @override
  SavingsScreenState createState() => SavingsScreenState();
}

class SavingsScreenState extends State<SavingsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _targetController = TextEditingController();

  void _addGoal() {
    if (_formKey.currentState!.validate()) {
      final goal = SavingGoal(
        id: DateTime.now().toString(),
        name: _nameController.text,
        target: double.parse(_targetController.text),
        current: 0,
        targetDate: DateTime.now().add(const Duration(days: 30)),
        created: DateTime.now(),
      );
      DbHelper.savingsBox.add(goal);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Goal added successfully!')),
      );
      _nameController.clear();
      _targetController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Savings Goals'),
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
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Goal Name',
                          prefixIcon: Icon(Icons.flag),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a goal name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _targetController,
                        decoration: const InputDecoration(
                          labelText: 'Target Amount',
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a target amount';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _addGoal,
                        child: const Text('Add Goal'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ValueListenableBuilder(
              valueListenable: DbHelper.savingsBox.listenable(),
              builder: (context, Box<SavingGoal> box, _) {
                if (box.isEmpty) {
                  return const Center(child: Text('No savings goals yet.'));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      final goal = box.getAt(index)!;
                      final progress = goal.current / goal.target;
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(goal.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('\$${goal.current.toStringAsFixed(2)} / \$${goal.target.toStringAsFixed(2)}'),
                              const SizedBox(height: 8),
                              LinearProgressIndicator(
                                value: progress,
                                backgroundColor: Colors.grey[200],
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}