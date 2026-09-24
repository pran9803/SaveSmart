import '../domain/goal.dart';
import 'goal_repository.dart';

class InMemoryGoalRepository implements GoalRepository {
  final List<Goal> _goals = [
    Goal(
      id: 'goal-1',
      name: 'New Bike',
      targetAmountPaise: 8000000,
      savedAmountPaise: 4500000,
      createdAt: DateTime.utc(2026, 1, 1),
    ),
    Goal(
      id: 'goal-2',
      name: 'Goa Trip',
      targetAmountPaise: 3000000,
      savedAmountPaise: 1800000,
      createdAt: DateTime.utc(2026, 2, 1),
    ),
  ];

  @override
  Future<List<Goal>> getGoals() async {
    return List.unmodifiable(_goals);
  }

  @override
  Future<Goal?> getGoalById(String id) async {
    for (final goal in _goals) {
      if (goal.id == id) {
        return goal;
      }
    }

    return null;
  }

  @override
  Future<Goal> createGoal({
    required String name,
    required int targetAmountPaise,
  }) async {
    final goal = Goal(
      id: 'goal-${_goals.length + 1}',
      name: name,
      targetAmountPaise: targetAmountPaise,
      savedAmountPaise: 0,
      createdAt: DateTime.now().toUtc(),
    );

    _goals.add(goal);

    return goal;
  }
}
