import 'package:flutter/material.dart';
import 'package:project_x_flutter/presentation/pages/home_page.dart';
import 'package:project_x_flutter/presentation/pages/product_detail_page.dart';
import 'package:project_x_flutter/presentation/pages/product_find_page.dart';
import 'package:project_x_flutter/presentation/pages/product_sell_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/find-product':
        return MaterialPageRoute(builder: (_) => FindProductPage());
      case '/sell-product':
        return MaterialPageRoute(builder: (_) => SellProductPage());
      case '/product-detail':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => ProductDetailPage(listData: args),
          );
        }
        //    If args is not of the correct type, return an error page.
        //   You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
