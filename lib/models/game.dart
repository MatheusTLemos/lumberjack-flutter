class Game {
  Game({
    required this.name,
    required this.score,
    required this.estimatedCompletionTime,
    required this.addedAt,
  });

  final String name;
  final double score;
  final double estimatedCompletionTime;
  final DateTime addedAt;

  double get value => score * 100 / estimatedCompletionTime;

  Game.fromMap(Map map)
      : name = map['name'],
        score = map['score'],
        estimatedCompletionTime = map['estimatedCompletionTime'],
        addedAt = DateTime.parse(map['addedAt']);

  Map toMap() => {
        'name': name,
        'score': score,
        'estimatedCompletionTime': estimatedCompletionTime,
        'addedAt': addedAt.toIso8601String(),
      };
}
