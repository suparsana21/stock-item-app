// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse()
    ..error = json['error'] as bool
    ..message = json['message'] as String
    ..data = json['data'] == null
        ? null
        : User.fromJson(json['data'] as Map<String, dynamic>)
    ..code = json['code'] as num;
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
      'code': instance.code
    };
