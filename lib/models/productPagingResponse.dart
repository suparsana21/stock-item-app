import 'package:json_annotation/json_annotation.dart';
import "product.dart";
part 'productPagingResponse.g.dart';

@JsonSerializable()
class ProductPagingResponse {
    ProductPagingResponse();

    num current_page;
    List<Product> data;
    String first_page_url;
    num from;
    num last_page;
    String last_page_url;
    String next_page_url;
    String path;
    String per_page;
    String prev_page_url;
    num to;
    num total;
    
    factory ProductPagingResponse.fromJson(Map<String,dynamic> json) => _$ProductPagingResponseFromJson(json);
    Map<String, dynamic> toJson() => _$ProductPagingResponseToJson(this);
}
