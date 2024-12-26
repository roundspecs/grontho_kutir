import 'package:grontho_kutir/grontho_kutir.dart';

class BookModel extends Book {
  const BookModel({
    required super.id,
    required super.title,
    required super.author,
    required super.category,
    required super.copiesCount,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      category: Category.fromString(json['category']),
      copiesCount: _getCopiesCount(json),
    );
  }

  static int _getCopiesCount(Map<String, dynamic> json) {
    try {
      return json['copies'][0]['count'] ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'category': category.toString(),
    };
  }
}
