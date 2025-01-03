import 'package:grontho_kutir/grontho_kutir.dart';

class CopyModel extends Copy {
  CopyModel({
    required super.id,
    required super.book,
    required super.condition,
    required super.owner,
    required super.representative,
  });

  factory CopyModel.fromJson(Map<String, dynamic> json) {
    return CopyModel(
      id: json['id'],
      book: BookModel.fromJson(json['book']),
      condition: json['condition'],
      owner: UserModel.fromMap(json['owner']),
      representative: UserModel.fromMap(json['representative']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'book_id': book.id,
      'condition': condition,
      'owner_id': owner.id,
      'representative_id': representative.id,
    };
  }
}
