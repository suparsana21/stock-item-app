// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..password = json['password'] as String
    ..token = json['token'] as String
    ..created_at = json['created_at'] as String
    ..updated_at = json['updated_at'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'token': instance.token,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at
    };
