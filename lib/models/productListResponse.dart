import 'package:json_annotation/json_annotation.dart';
import "product.dart";
part 'productListResponse.g.dart';

@JsonSerializable()
class ProductListResponse {
    ProductListResponse();

    bool error;
    String message;
    List<Product> data;
    num code;
    
    factory ProductListResponse.fromJson(Map<String,dynamic> json) => _$ProductListResponseFromJson(json);
    Map<String, dynamic> toJson() => _$ProductListResponseToJson(this);
}
