
import 'package:stock_item/models/index.dart';
import 'package:stock_item/models/product.dart';
import 'package:stock_item/services/rest_api.dart';
import 'package:stock_item/viewmodel/base_view_model.dart';

class DashboardViewModel extends BaseViewModel {

  RestApi _api = new RestApi();

  List<Product> products = [];

  int totalProduct = 0;

  DashboardViewModel(){
    this.main();
  }

  Future main() async {

    ProductListResponse productListResponse = await _api.getProduct(type: "newly");

    products = productListResponse.data;

    totalProduct = await _api.getProductTotal();

    print(totalProduct);

    notifyListeners();

  }

}