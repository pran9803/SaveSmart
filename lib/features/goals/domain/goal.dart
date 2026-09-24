class Goal {
  const Goal({
    required this.id,
    required this.name,
    required this.targetAmountPaise,
    required this.savedAmountPaise,
    required this.createdAt,
  });

  final String id;
  final String name;

  /// Monetary values are stored as integer paise.
  final int targetAmountPaise;
  final int savedAmountPaise;

  final DateTime createdAt;

  double get progress {
    if (targetAmountPaise <= 0) {
      return 0;
    }

    return (savedAmountPaise / targetAmountPaise).clamp(0.0, 1.0);
  }

  int get remainingAmountPaise {
    final remaining = targetAmountPaise - savedAmountPaise;

    return remaining > 0 ? remaining : 0;
  }
}
