import 'package:flutter/material.dart';
import 'package:noxdigitalweb/constants/skeletons.dart';
import 'package:noxdigitalweb/constants/widgets.dart';
import 'package:skeletons/skeletons.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: W.appBarForDrawerPages(x: context, title: "Ayarlar"),
      body: Center(
        child: Skeleton(
            isLoading: true,
            skeleton: Skeletons.skeletonListView,
            child: Container()),
      ),
    );
  }
}
