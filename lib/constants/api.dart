import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:noxdigitalweb/models/product.dart';

import '../models/brands.dart';
import '../models/products.dart';

class URL {
  static const String baseUrlAPI = "http://127.0.0.1:8000/api/";
  static const String user = "user/";
  static const String mainPageUser = baseUrlAPI + user + "mainpage";
  static const String brandsUser = baseUrlAPI + user + "brands";
  static const String productsUser = baseUrlAPI + user + "products";
  static const String productUser = baseUrlAPI + user + "products";
}

class API {
  static Future<BrandsModel> getBrands() async {
    var request = http.MultipartRequest('GET', Uri.parse(URL.brandsUser));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responsebody = await response.stream.bytesToString();
      var decodedJson = jsonDecode(responsebody);
      BrandsModel brands = BrandsModel.fromJson(decodedJson);
      return brands;
    } else {
      BrandsModel brands = BrandsModel();
      return brands;
    }
  }

  static Future<ProductsModel> getProducts(String locale) async {
    var request =
        http.MultipartRequest('GET', Uri.parse(URL.productsUser + "/$locale"));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responsebody = await response.stream.bytesToString();
      var decodedJson = jsonDecode(responsebody);
      ProductsModel products = ProductsModel.fromJson(decodedJson);
      return products;
    } else {
      ProductsModel products = ProductsModel();
      return products;
    }
  }

  static Future<ExamineProductModel> getProduct(String locale, int id) async {
    var request = http.MultipartRequest(
        'GET', Uri.parse(URL.productUser + "/$locale/$id"));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responsebody = await response.stream.bytesToString();
      var decodedJson = jsonDecode(responsebody);
      ExamineProductModel product = ExamineProductModel.fromJson(decodedJson);
      return product;
    } else {
      ExamineProductModel product = ExamineProductModel();
      return product;
    }
  }
}
