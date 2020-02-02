
import 'package:stock_item/models/auth/user.dart';
import 'package:stock_item/models/auth/userResponse.dart';
import 'package:stock_item/models/product/product.dart';
import 'package:stock_item/models/product/productListResponse.dart';
import 'package:stock_item/services/rest_api.dart';
import 'package:stock_item/services/view_state.dart';
import 'package:stock_item/viewmodel/base_view_model.dart';

class AuthViewModel extends BaseViewModel {

  RestApi _api = new RestApi();


  AuthViewModel(){

  }

  Future<UserResponse> login(User user) async {

    setState(ViewState.Busy);

    UserResponse userResponse = await _api.login(user);

    setState(ViewState.Idle);

    return userResponse;

  }

  Future<UserResponse> register(User user) async {
    setState(ViewState.Busy);

    UserResponse userResponse = await _api.register(user);

    setState(ViewState.Idle);

    return userResponse;

  }

  Future checkAuth() async {

  }

}