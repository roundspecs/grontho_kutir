import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    String? id,
    required String name,
    @JsonKey(name: 'hall_name') required String hallName,
    @JsonKey(name: 'room_number') required String roomNumber,
    required String email,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required String role,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
