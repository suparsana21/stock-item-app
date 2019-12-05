
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_item/pages/base_view.dart';
import 'package:stock_item/viewmodel/dashboard_view_model.dart';
import 'package:stock_item/viewmodel/product_view_model.dart';
import 'package:stock_item/widgets/product_list_item.dart';

class ProductList extends StatefulWidget {

  @override
  _ProductListState createState() => _ProductListState();

}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductViewModel>(
        builder: (_) => ProductViewModel(),
        child: Consumer(
        builder: (context,ProductViewModel model,_) => Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: Container(
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                    Navigator.pop(context);
                  },color: Colors.black54,),
                  Expanded(
                    flex: 10,
                    child: Text("Daftar Produk",textAlign : TextAlign.center,style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16
                    ),),
                  ),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
            titleSpacing: 0.0,
            automaticallyImplyLeading: false
        ),
        body: ListView.builder(
          itemCount: model.products.length,
          itemBuilder: (BuildContext context,int index) {
            return ProductListItem(model.products[index]);
          },
        ),
      ),
    ));
  }

}