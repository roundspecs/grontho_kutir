enum Category {
  all(name: 'All'),
  academic(name: 'Academic'),
  nonAcademic(name: 'Non-Academic'),
  ;

  final String name;
  const Category({required this.name});

  static List<Category> get categories => [
        Category.academic,
        Category.nonAcademic,
      ];

  static Category fromString(String category) {
    return Category.values.firstWhere((e) => e.name == category);
  }

  @override
  String toString() => name;
}
