
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_item/config/app_config.dart';
import 'package:stock_item/models/index.dart';
import 'package:http/http.dart' as http;

class RestApi {

  static String endpoint = "http://phpstack-346672-1146671.cloudwaysapps.com";

  var client = new http.Client();

  /**
   * Login
   */

  Future<UserResponse> login(User user) async {

    var url = "${endpoint}/login";
    var response = await client.post(
        url, // Url
        body: json.encode(user),
        headers: {
          'Content-type' : 'application/json',
        }
    );

    return UserResponse.fromJson(json.decode(response.body));
  }

  Future<UserResponse> getProfile() async {

    SharedPreferences fp = await SharedPreferences.getInstance();
    var token = fp.getString(AppConfig.API_KEY);

    var url = "${endpoint}/profile";
    var response = await client.get(
        url, // Url
        headers: {
          "Authorization" : "Bearer ${token}"
        }
    );

    return UserResponse.fromJson(json.decode(response.body));

  }

  Future<UserResponse> register(User user) async {

    var url = "${endpoint}/register";
    var response = await client.post(
        url, // Url
        body: json.encode(user),
        headers: {
          'Content-type' : 'application/json',
        }
    );

    return UserResponse.fromJson(json.decode(response.body));
  }

  Future<ProductListResponse> getProduct({limit : 5, type : ""}) async {

    SharedPreferences fp = await SharedPreferences.getInstance();
    var token = fp.getString(AppConfig.API_KEY);

    var url = "${endpoint}/product-list?limit=${limit}&type=${type}";
    var response = await client.get(
      url, // Url
      headers: {
        "Authorization" : "Bearer ${token}"
      }
    );

    return ProductListResponse.fromJson(json.decode(response.body));
  }

  Future<int> getProductTotal() async {
    SharedPreferences fp = await SharedPreferences.getInstance();
    var token = fp.getString(AppConfig.API_KEY);

    var url = "${endpoint}/product-count";
    var response = await client.get(
        url, // Url
        headers: {
          "Authorization" : "Bearer ${token}"
        }
    );

    return int.parse(response.body);
  }

  Future<ProductPagingResponse> getProductPaging({limit : 12, search : "",page : 1}) async {
    SharedPreferences fp = await SharedPreferences.getInstance();
    var token = fp.getString(AppConfig.API_KEY);

    var url = "${endpoint}/product?limit=${limit}&search=${search}&page=${page}";
    var response = await client.get(
        url, // Url
        headers: {
          "Authorization" : "Bearer ${token}"
        }
    );

    print(response.body);

    return ProductPagingResponse.fromJson(json.decode(response.body));
  }

}