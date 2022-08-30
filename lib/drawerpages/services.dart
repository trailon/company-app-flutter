import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';
import 'package:colorful_iconify_flutter/icons/vscode_icons.dart';
import 'package:noxdigitalweb/constants/constants.dart';
import 'package:noxdigitalweb/constants/skeletons.dart';
import 'package:noxdigitalweb/constants/widgets.dart';
import 'package:skeletons/skeletons.dart';

class Services extends StatefulWidget {
  Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  bool _isLoading = true;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext _) {
    return Scaffold(
      appBar: W.appBarForDrawerPages(x: _, title: C.T(_).services),
      body: Center(
        child: Skeleton(
            isLoading: _isLoading,
            skeleton: Skeletons.skeletonListView,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 2,
                  children: [
                    W.defaultcard(
                        x: _,
                        cw: W.header(
                            FontAwesomeIcons.code, C.T(_).servicesP1header,
                            f: 32, x: _)),
                    W.defaultcard(
                        x: _,
                        cw: W.header(FontAwesomeIcons.screwdriverWrench,
                            C.T(_).servicesP2header,
                            f: 32, x: _)),
                    W.defaultcard(
                        x: _,
                        cw: W.header(
                            FontAwesomeIcons.bullhorn, C.T(_).servicesP3header,
                            f: 32, x: _)),
                    W.defaultcard(
                        x: _,
                        cw: W.header(FontAwesomeIcons.cartShopping,
                            C.T(_).servicesP4header,
                            f: 32, x: _))
                  ],
                ),
                Divider(height: C.h(_) / 40, thickness: 1, color: Colors.black),
                W.text(C.T(_).servicesTextBodyP1, x: _),
                W.text(C.T(_).servicesTextHeaderP2, x: _),
                W.text(C.T(_).servicesTextBodyP2, x: _),
                Divider(height: C.h(_) / 40, thickness: 1, color: Colors.black),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 15,
                  children: [
                    W.headericonify(icon: Logos.vue, text: "Vue.js", x: _),
                    W.headericonify(icon: Logos.react, text: "React", x: _),
                    W.headericonify(
                        icon: Logos.angular_icon, text: "Angular", x: _),
                    W.headericonify(icon: Logos.mysql, text: "MySQL", x: _),
                    W.headericonify(icon: Logos.flutter, text: "Flutter", x: _),
                    W.headericonify(
                        icon: Logos.dotnet, text: "Microsoft.NET", x: _),
                    W.headericonify(
                        icon: VscodeIcons.file_type_php2, text: "PHP", x: _),
                    W.headericonify(
                        icon: Logos.google_play_icon, text: "Play Store", x: _),
                    W.headericonify(
                        icon: Logos.apple_app_store, text: "App Store", x: _),
                    W.headericonify(icon: Logos.java, text: "Java", x: _),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
