import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes.dart';
import '../data/in_memory_goal_repository.dart';
import '../domain/goal.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final InMemoryGoalRepository _repository = InMemoryGoalRepository();

  late Future<List<Goal>> _goalsFuture;

  @override
  void initState() {
    super.initState();

    _loadGoals();
  }

  void _loadGoals() {
    _goalsFuture = _repository.getGoals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Goals')),
      body: FutureBuilder<List<Goal>>(
        future: _goalsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Unable to load goals.'));
          }

          final goals = snapshot.data ?? [];

          if (goals.isEmpty) {
            return const Center(child: Text('No goals yet.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: goals.length,
            itemBuilder: (context, index) {
              return _GoalCard(goal: goals[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRoutes.newGoal);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    final progressPercentage = (goal.progress * 100).round();

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(goal.name, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            LinearProgressIndicator(value: goal.progress),
            const SizedBox(height: 8),
            Text(
              '${_formatAmount(goal.savedAmountPaise)} of '
              '${_formatAmount(goal.targetAmountPaise)} '
              '• $progressPercentage%',
            ),
          ],
        ),
      ),
    );
  }

  String _formatAmount(int paise) {
    final rupees = paise ~/ 100;
    return '₹${_formatIndianNumber(rupees)}';
  }

  String _formatIndianNumber(int value) {
    final digits = value.toString();

    if (digits.length <= 3) {
      return digits;
    }

    final lastThree = digits.substring(digits.length - 3);
    var remaining = digits.substring(0, digits.length - 3);

    final parts = <String>[];

    while (remaining.length > 2) {
      parts.insert(0, remaining.substring(remaining.length - 2));
      remaining = remaining.substring(0, remaining.length - 2);
    }

    if (remaining.isNotEmpty) {
      parts.insert(0, remaining);
    }

    return '${parts.join(',')},$lastThree';
  }
}
