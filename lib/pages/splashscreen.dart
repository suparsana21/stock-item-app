
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_item/config/app_config.dart';
import 'package:stock_item/pages/auth/login.dart';
import 'package:stock_item/viewmodel/auth_view_model.dart';
import 'package:stock_item/viewmodel/dashboard_view_model.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() =>_SplashScreenState();


}

class _SplashScreenState extends State<SplashScreen> {

  SharedPreferences fp;

  _delayAction () async {
      var _duration = Duration(seconds: 2);

      fp = await SharedPreferences.getInstance();

      return Timer(_duration, _nextPage);

  }

  _nextPage() async {

    var apiKey = fp.getString(AppConfig.API_KEY);
    var status = fp.getString(AppConfig.STATUS);

    if((apiKey != null)) {



    } else {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
    }

  }

  @override
  void initState() {
    _delayAction();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<AuthViewModel>(
        builder: (_) => AuthViewModel(),
        child: Consumer(
            builder: (context,AuthViewModel model,_) => Scaffold(
              body: SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width : 150,child: Image.asset("assets/box.png")),
                      Container(
                          margin: EdgeInsets.only(top : 16),
                          child: Text("Stock Item",style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600
                          ),)
                      )
                    ],
                  ),
                ),
              ),
            )
        ));
  }
}
