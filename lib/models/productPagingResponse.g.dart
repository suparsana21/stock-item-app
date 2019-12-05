// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productPagingResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPagingResponse _$ProductPagingResponseFromJson(
    Map<String, dynamic> json) {
  return ProductPagingResponse()
    ..current_page = json['current_page'] as num
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..first_page_url = json['first_page_url'] as String
    ..from = json['from'] as num
    ..last_page = json['last_page'] as num
    ..last_page_url = json['last_page_url'] as String
    ..next_page_url = json['next_page_url'] as String
    ..path = json['path'] as String
    ..per_page = json['per_page'] as String
    ..prev_page_url = json['prev_page_url'] as String
    ..to = json['to'] as num
    ..total = json['total'] as num;
}

Map<String, dynamic> _$ProductPagingResponseToJson(
        ProductPagingResponse instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
      'first_page_url': instance.first_page_url,
      'from': instance.from,
      'last_page': instance.last_page,
      'last_page_url': instance.last_page_url,
      'next_page_url': instance.next_page_url,
      'path': instance.path,
      'per_page': instance.per_page,
      'prev_page_url': instance.prev_page_url,
      'to': instance.to,
      'total': instance.total
    };
