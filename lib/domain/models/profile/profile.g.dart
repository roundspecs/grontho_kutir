// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      hallName: json['hall_name'] as String,
      roomNumber: json['room_number'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'name': instance.name,
      'hall_name': instance.hallName,
      'room_number': instance.roomNumber,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'role': instance.role,
    };
