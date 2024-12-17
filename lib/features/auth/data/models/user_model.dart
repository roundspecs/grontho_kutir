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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      phoneNumber: json['user_metadata']['phone_number'],
      name: json['user_metadata']['name'],
      hallName: json['user_metadata']['hall_name'],
      roomNumber: json['user_metadata']['room_number'],
    );
  }
}
