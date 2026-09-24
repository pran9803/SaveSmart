import '../domain/goal.dart';

abstract class GoalRepository {
  Future<List<Goal>> getGoals();

  Future<Goal> createGoal({
    required String name,
    required int targetAmountPaise,
  });

  Future<Goal?> getGoalById(String id);
}
