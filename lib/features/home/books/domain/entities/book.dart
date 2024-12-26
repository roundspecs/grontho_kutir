import 'package:grontho_kutir/grontho_kutir.dart';

class Book {
  final int id;
  final String title;
  final String author;
  final Category category;
  final int copiesCount;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.copiesCount,
  });
}
