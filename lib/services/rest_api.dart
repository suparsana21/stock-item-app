
import 'dart:convert';

import 'package:stock_item/models/index.dart';
import 'package:stock_item/models/productListResponse.dart';
import 'package:http/http.dart' as http;

class RestApi {

  static String endpoint = "http://localhost:8000";

  var client = new http.Client();

  Future<ProductListResponse> getProduct({limit : 5, type : ""}) async {

    var url = "${endpoint}/product-list?limit=${limit}&type=${type}";
    var response = await client.get(
      url, // Url
      headers: {
        // Put Header
      }
    );

    return ProductListResponse.fromJson(json.decode(response.body));
  }

  Future<int> getProductTotal() async {

    var url = "${endpoint}/product-count";
    var response = await client.get(
        url, // Url
        headers: {
          // Put Header
        }
    );

    return int.parse(response.body);
  }

  Future<ProductPagingResponse> getProductPaging({limit : 12, search : "",page : 1}) async {

    var url = "${endpoint}/product?limit=${limit}&search=${search}&page=${page}";
    var response = await client.get(
        url, // Url
        headers: {
          // Put Header
        }
    );

    print(response.body);

    return ProductPagingResponse.fromJson(json.decode(response.body));
  }

}