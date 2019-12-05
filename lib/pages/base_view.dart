
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_item/viewmodel/dashboard_view_model.dart';

class BaseView<T extends ChangeNotifier> extends StatelessWidget {

  Widget Function(BuildContext context,T model,Widget child) builder;

  BaseView({
    this.builder
  });

  T model ;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        builder: (_) => model,
        child: Consumer(
        builder: builder)
    );
  }

}