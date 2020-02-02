// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product()
    ..id = json['id'] as num
    ..code = json['code'] as String
    ..name = json['name'] as String
    ..price = json['price'] as num
    ..photo = json['photo'] as String
    ..created_at = json['created_at'] as String
    ..updated_at = json['updated_at'] as String
    ..deleted_at = json['deleted_at'] as String;
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'price': instance.price,
      'photo': instance.photo,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at
    };
