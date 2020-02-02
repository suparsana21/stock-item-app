
import 'package:stock_item/models/auth/user.dart';
import 'package:stock_item/models/auth/userResponse.dart';
import 'package:stock_item/models/product/product.dart';
import 'package:stock_item/models/product/productListResponse.dart';
import 'package:stock_item/services/rest_api.dart';
import 'package:stock_item/viewmodel/base_view_model.dart';

class DashboardViewModel extends BaseViewModel {

  RestApi _api = new RestApi();

  List<Product> products = [];

  User user;

  int totalProduct = 0;

  DashboardViewModel(){
    this.main();
  }

  Future main() async {

    Future.wait([
      getProduct(),
      getProfile()
    ]);


  }

  Future getProduct() async {
    ProductListResponse productListResponse = await _api.getProduct(type: "newly");

    products = productListResponse.data;

    totalProduct = await _api.getProductTotal();

    notifyListeners();
  }

  Future getProfile() async {
    UserResponse userResponse = await _api.getProfile();

    user = userResponse.data;

    notifyListeners();
  }

  Future checkAuth() async {

  }

}