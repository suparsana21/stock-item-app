
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_item/config/responsive_layout.dart';
import 'package:stock_item/pages/base_view.dart';
import 'package:stock_item/pages/product/product_list.dart';
import 'package:stock_item/viewmodel/dashboard_view_model.dart';
import 'package:stock_item/widgets/custom_flat_button.dart';
import 'package:stock_item/widgets/panel.dart';
import 'package:stock_item/widgets/product_list_item.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {

    ResponsiveLayout layout = ResponsiveLayout(context);

    return ChangeNotifierProvider<DashboardViewModel>(
        builder: (_) => DashboardViewModel(),
        child: Consumer(
          builder: (context,DashboardViewModel model,_) => Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 1,
                title: Container(
                  child: Row(
                    children: <Widget>[

                      Expanded(
                        child: Text("Dashboard",textAlign : TextAlign.center,style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16
                        ),),
                      ),
                    ],
                  ),
                ),
                titleSpacing: 0.0,
                automaticallyImplyLeading: false
            ),
            body: RefreshIndicator(
              onRefresh: () async {

                await model.main();
                return null;
              },
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(layout.mediumPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: layout.mediumPadding),
                          child: Text("Dashboard",style: TextStyle(
                              fontWeight: FontWeight.w500
                          ),),
                        ),
                        Panel(
                          child: Column(
                            children: <Widget>[
                              Text(model.totalProduct.toString(),style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                              ),),
                              Container(
                                margin: EdgeInsets.only(top: layout.mediumPadding),
                                child: Text("Total Produk",style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),),
                              ),

                            ],
                          ),
                          color: Colors.lightBlueAccent,
                        ),
                        Container(
                          margin: EdgeInsets.only(top : layout.mediumPadding,bottom: layout.mediumPadding),
                          child: Text("Menu",style: TextStyle(
                              fontWeight: FontWeight.w500
                          ),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomFlatButton(
                              image : Image.asset("assets/box.png"),
                              title: "Produk",
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => ProductList()));
                              },
                            ),
                            CustomFlatButton(
                              image : Image.asset("assets/transaction.png"),
                              title: "Transaksi",
                              onPressed: (){

                              },
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top : layout.mediumPadding,bottom: layout.smallPadding),
                          child: Text("Produk Terbaru",style: TextStyle(
                              fontWeight: FontWeight.w500
                          ),),
                        ),
                        Column(
                          children: model.products.map((f) {
                            return ProductListItem(f);
                          }).toList(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ) ,
      ));

  }

}

