import 'package:grontho_kutir/grontho_kutir.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.phoneNumber,
    required super.name,
    required super.hallName,
    required super.roomNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      email: data['email'],
      phoneNumber: data['user_metadata']['phone_number'],
      name: data['user_metadata']['name'],
      hallName: data['user_metadata']['hall_name'],
      roomNumber: data['user_metadata']['room_number'],
    );
  }

  factory UserModel.fromDBJson({
    required Map<String, dynamic> data,
    required String email,
  }) {
    return UserModel(
      id: data['id'],
      email: email,
      phoneNumber: data['phone_number'],
      name: data['name'],
      hallName: data['hall_name'],
      roomNumber: data['room_number'],
    );
  }

  @override
  String toString() {
    return 'UserModel('
        'id: $id, '
        'email: $email, '
        'phoneNumber: $phoneNumber, '
        'name: $name, '
        'hallName: $hallName, '
        'roomNumber: $roomNumber)';
  }
}
