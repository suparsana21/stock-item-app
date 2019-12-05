
import 'package:stock_item/models/index.dart';
import 'package:stock_item/models/product.dart';
import 'package:stock_item/services/rest_api.dart';
import 'package:stock_item/services/view_state.dart';
import 'package:stock_item/viewmodel/base_view_model.dart';

class ProductViewModel extends BaseViewModel {

  RestApi _api = new RestApi();

  List<Product> products = [];

  int currentPages = 1;

  bool is_lastPage = false;

  ProductViewModel(){
    this.main();
  }

  Future main() async {

    setState(ViewState.Busy);

    ProductPagingResponse productListResponse = await _api.getProductPaging(search: "",page: currentPages);

    products = productListResponse.data;

    print(productListResponse);

    currentPages++;

    if(productListResponse.current_page == productListResponse.last_page) {
      is_lastPage = true;
    }

    setState(ViewState.Idle);

    notifyListeners();

  }

  Future getNextPage() async {

    ProductPagingResponse productListResponse = await _api.getProductPaging(search: "",page: currentPages);

    products.addAll(productListResponse.data);

    currentPages++;

    if(productListResponse.current_page == productListResponse.last_page) {
      is_lastPage = true;
    }

    notifyListeners();

  }



}