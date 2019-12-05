
import 'package:flutter/material.dart';
import 'package:stock_item/config/responsive_layout.dart';

class CustomFlatButton extends StatelessWidget {


  Image image ;
  String title = "";
  GestureTapCallback onPressed;

  CustomFlatButton({
    @required this.image,
    @required this.title,
    @required this.onPressed
  });


  @override
  Widget build(BuildContext context) {
    ResponsiveLayout layout = ResponsiveLayout(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Colors.black12
            )
        ),
        padding: EdgeInsets.all(layout.mediumPadding),
        child: Column(
          children: <Widget>[
            SizedBox(
              width : MediaQuery.of(context).size.width * .50 - 58,
              child: image,
            ),

            Container(
                margin: EdgeInsets.only(top : layout.mediumPadding),
                child: Text(title,style: TextStyle(
                    fontWeight: FontWeight.w600
                ),)
            )
          ],
        ),
      ),
    );
  }

}