import 'dart:async';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:noxdigitalweb/constants/api.dart';
import 'package:noxdigitalweb/constants/constants.dart';
import 'package:noxdigitalweb/constants/skeletons.dart';
import 'package:noxdigitalweb/constants/styles.dart';
import 'package:noxdigitalweb/constants/widgets.dart';
import 'package:noxdigitalweb/models/product.dart';

class ExamineProduct extends StatefulWidget {
  ExamineProduct({Key? key, required this.title, required this.productID})
      : super(key: key);
  String title;
  int productID;
  @override
  State<ExamineProduct> createState() => _ExamineProductState();
}

class _ExamineProductState extends State<ExamineProduct> {
  List<String> products = [];
  String projectbody = "";
  String usedtechs = "";
  late StreamController<ExamineProductModel> _productsStreamController;
  @override
  void initState() {
    _productsStreamController =
        StreamController<ExamineProductModel>.broadcast();
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext _) {
    return Center(
      child: Scaffold(
        appBar: W.appBarForDrawerPages(x: _, title: widget.title),
        body: StreamBuilder<ExamineProductModel>(
            stream: _productsStreamController.stream,
            builder: (context, product) {
              if (product.hasData) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          borderOnForeground: true,
                          elevation: 3,
                          child: SingleChildScrollView(
                            physics: const ScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: product.data!.data!.productImages!
                                    .map((imageurl) => InkWell(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: C.ar(_) * 16),
                                          child: Image.network(
                                            imageurl,
                                            scale: 3,
                                            height: C.ar(_) * 160,
                                            width: C.ar(_) * 160,
                                          ),
                                        ),
                                        onTap: () {
                                          final imageProvider =
                                              Image.network(imageurl).image;
                                          try {
                                            showImageViewer(
                                                context, imageProvider,
                                                useSafeArea: true,
                                                closeButtonTooltip: "Geri",
                                                immersive: false,
                                                onViewerDismissed: () {});
                                          } catch (e) {
                                            Navigator.pop(context);
                                          }
                                        }))
                                    .toList()),
                          ),
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                            text: "Proje Kapsamı\n",
                            style: S.longtextstyle(
                                context: _, fW: FontWeight.bold, factor: 30),
                            children: [
                              TextSpan(
                                  text: product.data!.data!.description,
                                  style: S.longtextstyle(
                                      context: _,
                                      factor: 25,
                                      fW: FontWeight.w400)),
                              TextSpan(
                                  text: "\n\nKullanılan Teknolojiler:\n",
                                  style: S.longtextstyle(
                                      context: _,
                                      fW: FontWeight.bold,
                                      factor: 30)),
                              TextSpan(
                                  text: product.data!.data!.usedTechs,
                                  style: S.longtextstyle(
                                      context: _,
                                      factor: 25,
                                      fW: FontWeight.w400)),
                            ]),
                      ),
                    ],
                  ),
                );
              }
              return Skeletons.skeletonListView;
            }),
      ),
    );
  }

  void loadProducts() {
    API
        .getProduct("tr", widget.productID)
        .then((value) => _productsStreamController.add(value));
  }
}
