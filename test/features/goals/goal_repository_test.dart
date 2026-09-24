import 'package:flutter_test/flutter_test.dart';
import 'package:save_smart/features/goals/data/in_memory_goal_repository.dart';

void main() {
  group('InMemoryGoalRepository', () {
    test('returns initial goals', () async {
      final repository = InMemoryGoalRepository();

      final goals = await repository.getGoals();

      expect(goals.length, 2);
      expect(goals.first.name, 'New Bike');
    });

    test('creates a new goal', () async {
      final repository = InMemoryGoalRepository();

      final goal = await repository.createGoal(
        name: 'Emergency Fund',
        targetAmountPaise: 10000000,
      );

      expect(goal.name, 'Emergency Fund');
      expect(goal.targetAmountPaise, 10000000);
      expect(goal.savedAmountPaise, 0);
    });

    test('calculates progress correctly', () async {
      final repository = InMemoryGoalRepository();

      final goal = await repository.getGoalById('goal-1');

      expect(goal, isNotNull);
      expect(goal!.progress, closeTo(0.5625, 0.0001));
    });
  });
}
