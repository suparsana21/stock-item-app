
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_item/config/app_config.dart';
import 'package:stock_item/config/responsive_layout.dart';
import 'package:stock_item/pages/auth/login.dart';
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

  Future<void> _confirmModal() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(margin: EdgeInsets.only(left: 16),child: Text("Are you sure want to log out?"))
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Log Out'),
              onPressed: () async {
                var sp = await SharedPreferences.getInstance();
                sp.setString(AppConfig.API_KEY, null);

                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()) , (Route<dynamic> route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    ResponsiveLayout layout = ResponsiveLayout(context);

    return ChangeNotifierProvider<DashboardViewModel>(
        builder: (_) => DashboardViewModel(),
        child: Consumer(
          builder: (context,DashboardViewModel model,_) => Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black54),
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
//                automaticallyImplyLeading: false,
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.space_bar),color: Colors.white,onPressed: (){

                  },)
                ],
            ),
            drawer:  Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: SafeArea(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      child: Container(
                        margin: EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.account_circle,color: Colors.black54,size: 60,),
                            Container(
                              margin: EdgeInsets.only(top : 16),
                              child: Text("Hello, "),
                            ),
                            Container(
                              margin: EdgeInsets.only(top : 16),
                              child: Text(model.user == null ? "-" : model.user.name),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                      ),
                    ),
                    ListTile(
                      title: Text('Logout'),
                      onTap: () {
                        _confirmModal();
                      },
                    ),
                  ],
                ),
              ),
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

