import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noxdigitalweb/constants/constants.dart';
import 'package:noxdigitalweb/constants/skeletons.dart';
import 'package:noxdigitalweb/constants/styles.dart';
import 'package:noxdigitalweb/constants/widgets.dart';
import 'package:skeletons/skeletons.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: W.appBarForDrawerPages(x: context, title: "Hakkımızda"),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            W.text(C.T(context).aboutus, x: context),
            W.header(FontAwesomeIcons.slack, C.T(context).aboutusP1header,
                x: context),
            W.text(C.T(context).aboutuspageP1, x: context),
            W.text(C.T(context).aboutuspageP1S2, x: context),
            W.header(FontAwesomeIcons.trello, C.T(context).aboutusP2header,
                x: context),
            W.text(C.T(context).aboutuspageP2, x: context),
            W.header(FontAwesomeIcons.gitlab, C.T(context).aboutusP3header,cR: 
                Colors.orange.shade400,
                x: context),
            W.text(C.T(context).aboutuspageP3, x: context),
          ],
        ));
  }
}
