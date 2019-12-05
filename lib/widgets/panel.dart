
import 'package:flutter/material.dart';
import 'package:stock_item/config/responsive_layout.dart';

class Panel extends StatelessWidget {

  Widget child;

  EdgeInsets margin = EdgeInsets.all(0);

  Color color;

  Panel({
    @required this.child,
    this.margin,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveLayout layout = ResponsiveLayout(context);

    return Container(
      width: layout.width,
      margin: margin,
      padding: EdgeInsets.all(layout.mediumPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
        ),
        color: color
      ),
      child: child,
    );
  }

}