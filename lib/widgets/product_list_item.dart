
import 'package:flutter/material.dart';
import 'package:stock_item/config/helper.dart';
import 'package:stock_item/config/responsive_layout.dart';
import 'package:stock_item/models/product.dart';
import 'package:stock_item/widgets/panel.dart';

class ProductListItem extends StatelessWidget {

  ProductListItem(this.product);

  Product product;

  @override
  Widget build(BuildContext context) {
    ResponsiveLayout layout = ResponsiveLayout(context);
    return Panel(
      margin: EdgeInsets.only(top: layout.miniPadding,bottom: layout.miniPadding),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(product.name,style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              ),),
            ],
          ),
          Container(
            child: Text("Rp "+Helper.localNumber(product.price),style: TextStyle(
              color: Colors.black26,
            ),),
          )

        ],
      ),
    );
  }

}
