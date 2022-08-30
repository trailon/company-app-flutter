import 'dart:async';

import 'package:flutter/material.dart';
import 'package:noxdigitalweb/constants/api.dart';
import 'package:noxdigitalweb/constants/skeletons.dart';
import 'package:noxdigitalweb/constants/styles.dart';
import 'package:noxdigitalweb/constants/widgets.dart';
import 'package:noxdigitalweb/models/products.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late StreamController<ProductsModel> _productsStreamController;
  @override
  void initState() {
    _productsStreamController = StreamController<ProductsModel>();
    loadDataFromApi("tr");
    super.initState();
  }

  loadDataFromApi(String locale) async {
    ProductsModel myproducts = await API.getProducts(locale);
    _productsStreamController.add(myproducts);
  }

  @override
  Widget build(BuildContext _) {
    return Scaffold(
      appBar: W.appBarForDrawerPages(x: context, title: "Ürünlerimiz"),
      body: Center(
        child: StreamBuilder<ProductsModel>(
            stream: _productsStreamController.stream,
            builder: (context, products) {
              if (products.hasData) {
                return GridView.count(
                    crossAxisCount: 4,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    addRepaintBoundaries: true,
                    childAspectRatio: 0.7,
                    addSemanticIndexes: true,
                    primary: true,
                    children: products.data!.data!.map((product) {
                      return cardlisttile(
                          product.brandName!,
                          W.imageNetwork(product.imageFile!, x: _),
                          product.title!,
                          product.description!,
                          product.id!);
                    }).toList());
              }
              if (products.connectionState != ConnectionState.done) {
                return Skeletons.skeletonListView;
              }
              if (products.hasError) {
                return const Text("An error has occured!");
              }
              return Skeletons.skeletonListView;
            }),
      ),
    );
  }

  Widget cardlisttile(
      String title, Widget image, String text, String body, int id) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.grey,
      elevation: 10,
      color: Colors.white.withOpacity(0.70),
      child: ListTile(
        title: image,
        subtitle: Text.rich(
          TextSpan(
              text: text + "\n",
              style: S.longtextstyle(
                  context: context, factor: 30, fW: FontWeight.bold),
              children: [
                TextSpan(
                    text: "Proje Kapsamı:",
                    style: S.longtextstyle(
                        context: context, fW: FontWeight.bold, factor: 27.5)),
                TextSpan(
                    text: body,
                    style: S.longtextstyle(
                        context: context, factor: 25, fW: FontWeight.w400))
              ]),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          ExamineProductFields e =
              ExamineProductFields(title: title, productID: id);
          Navigator.pushNamed(context, "/examine", arguments: e);
        },
      ),
    );
  }
}

class ExamineProductFields {
  ExamineProductFields({required this.title, required this.productID});
  String title = "title";
  int productID = 0;
}
