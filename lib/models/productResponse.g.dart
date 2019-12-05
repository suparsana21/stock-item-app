// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  return ProductResponse()
    ..error = json['error'] as bool
    ..message = json['message'] as String
    ..data = json['data'] == null
        ? null
        : Product.fromJson(json['data'] as Map<String, dynamic>)
    ..code = json['code'] as num;
}

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
      'code': instance.code
    };
