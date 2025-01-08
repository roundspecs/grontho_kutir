import 'package:grontho_kutir/grontho_kutir.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.hallName,
    required super.roomNumber,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      hallName: json['hall_name'],
      roomNumber: json['room_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'hall_name': hallName,
      'room_number': roomNumber,
    };
  }

  @override
  String toString() {
    return 'ProfileModel('
        'id: $id, '
        'name: $name, '
        'email: $email, '
        'phoneNumber: $phoneNumber, '
        'hallName: $hallName, '
        'roomNumber: $roomNumber'
        ')';
  }
}
