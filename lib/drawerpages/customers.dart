import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:noxdigitalweb/constants/api.dart';
import 'package:noxdigitalweb/constants/constants.dart';
import 'package:noxdigitalweb/constants/skeletons.dart';
import 'package:noxdigitalweb/constants/widgets.dart';
import 'package:noxdigitalweb/models/brands.dart';

class Customers extends StatefulWidget {
  const Customers({Key? key}) : super(key: key);

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  late Future<BrandsModel> brandsData;
  @override
  initState() {
    brandsData = API.getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext _) {
    return Scaffold(
      appBar: W.appBarForDrawerPages(x: _, title: "Müşterilerimiz"),
      body: FutureBuilder<BrandsModel>(
          future: brandsData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: C.w(_) / 10),
                shrinkWrap: true,
                children: snapshot.data!.data!.map((brand) {
                  return Slidable(
                    key: const ValueKey(0),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {}),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: const Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.share,
                          label: 'Share',
                        ),
                      ],
                    ),
                    // The end action pane is the one at the right or the bottom side.
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          // An action can be bigger than the others.
                          flex: 2,
                          onPressed: (context) {},
                          backgroundColor: const Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.archive,
                          label: 'Archive',
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: const Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.save,
                          label: 'Save',
                        ),
                      ],
                    ),

                    // The child of the Slidable is what the user sees when the
                    // component is not dragged.
                    child: Container(
                      constraints: BoxConstraints(minWidth: C.w(_) / 1.1),
                      child: Card(
                          //color:Colors.lightBlueAccent.shade100.withOpacity(0.2),
                          elevation: 9,
                          child: W.imageNetwork(brand.imageFile, x: _)),
                    ),
                  );
                }).toList(),
              );
            }
            return Skeletons.skeletonListView;
          }),
    );
  }
}
