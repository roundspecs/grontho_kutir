enum Category {
  all(name: 'All'),
  academic(name: 'Academic'),
  nonAcademic(name: 'Non-Academic'),;

  final String name;
  const Category({required this.name});
}
