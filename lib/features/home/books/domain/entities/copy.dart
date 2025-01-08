import 'package:grontho_kutir/grontho_kutir.dart';

class Copy {
  final int id;
  final String condition;
  final Book book;
  final Profile owner;
  final Profile representative;

  Copy({
    required this.owner,
    required this.representative,
    required this.id,
    required this.book,
    required this.condition,
  });
}
