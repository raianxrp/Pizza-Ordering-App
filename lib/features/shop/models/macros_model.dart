class MacrosModel {
  int calories;
  int protein;
  int fat;
  int carbs;

  MacrosModel({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
  });

  static MacrosModel empty() => MacrosModel(
        calories: 0,
        protein: 0,
        fat: 0,
        carbs: 0,
      );

  toJson() {
    return {
      'Calories': calories,
      'Protein': protein,
      'Fat': fat,
      'Carbs': carbs,
    };
  }

  factory MacrosModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return MacrosModel.empty();
    return MacrosModel(
        calories: data['calories'] ?? 0,
        protein: data['protein'] ?? 0,
        fat: data['fat'] ?? 0,
        carbs: data['carbs'] ?? 0);
  }
}
