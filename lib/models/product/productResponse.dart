import 'package:json_annotation/json_annotation.dart';
import "product.dart";
part 'productResponse.g.dart';

@JsonSerializable()
class ProductResponse {
    ProductResponse();

    bool error;
    String message;
    Product data;
    num code;
    
    factory ProductResponse.fromJson(Map<String,dynamic> json) => _$ProductResponseFromJson(json);
    Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
