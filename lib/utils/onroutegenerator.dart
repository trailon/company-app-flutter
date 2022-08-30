import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:noxdigitalweb/drawerpages/aboutus.dart';
import 'package:noxdigitalweb/drawerpages/customers.dart';
import 'package:noxdigitalweb/drawerpages/products.dart';
import 'package:noxdigitalweb/drawerpages/services.dart';
import 'package:noxdigitalweb/drawerpages/settings.dart';
import 'package:noxdigitalweb/mainpages/examineproduct.dart';
import 'package:noxdigitalweb/mainpages/homepage.dart';

class RouteGenerator {
  static Route<dynamic>? _routeolustur(
      Widget gidilecekWidget, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
          builder: (context) => gidilecekWidget, settings: settings);
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
          builder: (context) => gidilecekWidget, settings: settings);
    } else {
      return MaterialPageRoute(
          builder: (context) => gidilecekWidget, settings: settings);
    }
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _routeolustur(MyHomePage(), settings);
      case '/aboutus':
        return _routeolustur(AboutUs(), settings);
      case '/services':
        return _routeolustur(Services(), settings);
      case '/products':
        return _routeolustur(const Products(), settings);
      case '/customers':
        return _routeolustur(const Customers(), settings);
      case '/settings':
        return _routeolustur(Settings(), settings);
      case '/examine':
        ExamineProductFields examineProductFields =
            settings.arguments as ExamineProductFields;
        return _routeolustur(
            ExamineProduct(
              title: examineProductFields.title,
              productID: examineProductFields.productID,
            ),
            settings);
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(title: const Text("HATA")),
                  body: const Center(
                    child: Text(
                      "SAYFA BULUNAMADI",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ));
    }
  }
}
