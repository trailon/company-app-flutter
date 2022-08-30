// ignore_for_file: deprecated_member_use

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:noxdigitalweb/constants/colors.dart';
import 'package:noxdigitalweb/constants/constants.dart';
import 'package:noxdigitalweb/constants/styles.dart';
import 'package:noxdigitalweb/drawer/controller.dart';
import 'package:url_launcher/url_launcher.dart';

class W {
  static ConvexAppBar getBottomAppBar(
      {required BuildContext context,
      required FancyDrawerController fancyController,
      required TabController tabController,
      required PageController pageController,
      required int lastindex}) {
    return ConvexAppBar(
      style: TabStyle.reactCircle,
      backgroundColor: Cr.noxColor,
      activeColor: Colors.white,
      controller: tabController,
      disableDefaultTabController: true,
      items: const [
        TabItem(
            icon: Icons.view_list_outlined,
            activeIcon: Icons.view_list,
            isIconBlend: true),
        TabItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            isIconBlend: true),
        TabItem(
            icon: Icons.work_outline, activeIcon: Icons.work, isIconBlend: true)
      ],
      onTap: (int i) {
        switch (i) {
          case 0:
            fancyController.open();
            break;
          case 1:
            break;
          case 2:
            break;
          default:
        }
      },
      onTabNotify: (int y) {
        switch (y) {
          case 0:
            break;
          case 1:
            if (pageController.page != 0.0) {
              pageController.jumpToPage(0);
            }
            break;
          case 2:
            if (pageController.page!.toInt() != 1.0) {
              pageController.jumpToPage(1);
            }
            break;
          default:
        }
        return true;
      },
    );
  }

  static AppBar appBarForDrawerPages(
      {required BuildContext x, required String title}) {
    return AppBar(
      backgroundColor: Cr.noxColor,
      title: Text(
        title,
        style: S.appbartextstyle(context: x),
      ),
      automaticallyImplyLeading: true,
    );
  }

  static Widget defaultcard({required Widget cw, required BuildContext x}) {
    return Card(
      shadowColor: Colors.grey,
      borderOnForeground: true,
      clipBehavior: Clip.hardEdge,
      semanticContainer: false,
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(left: C.w(x) / 30),
          child: cw,
        ),
      ),
    );
  }

  static Widget header(icon, text,
      {cR = const Color.fromRGBO(21, 130, 255, 1),
      double f = 45,
      required BuildContext x}) {
    return ListTile(
      horizontalTitleGap: 0,
      minLeadingWidth: 40,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      leading: FaIcon(icon, color: cR),
      title: Text(text,
          style: S.longtextstyle(context: x, fW: FontWeight.bold, factor: f)),
    );
  }

  static Widget headericonify(
      {required String icon, required String text, required BuildContext x}) {
    return ListTile(
      horizontalTitleGap: 0,
      minLeadingWidth: C.w(x) / 6,
      contentPadding: EdgeInsets.only(left: C.w(x) / 40),
      leading: Iconify(icon, size: C.w(x) / 7),
      title: Text(text,
          style: S.longtextstyle(context: x, fW: FontWeight.bold, factor: 28)),
    );
  }

  static Widget text(text, {required BuildContext x}) {
    return Padding(
      padding: EdgeInsets.only(bottom: C.ar(x) * 16),
      child: Text(
        text,
        style: S.longtextstyle(context: x, factor: 35),
      ),
    );
  }

  static Widget image(image, {required BuildContext x, double scale = 2}) {
    return Padding(
      padding: EdgeInsets.only(bottom: C.ar(x) * 16),
      child: Image.asset(
        image,
        scale: scale,
        height: C.ar(x) * 120,
        width: C.ar(x) * 120,
      ),
    );
  }

  static Widget imageNetwork(image,
      {required BuildContext x, double scale = 0.8}) {
    return Padding(
      padding: EdgeInsets.only(bottom: C.ar(x) * 16),
      child: Image.network(image, scale: scale, height: C.ar(x) * 120),
    );
  }

  static Widget productimage(image, {required BuildContext x}) {
    return Padding(
      padding: EdgeInsets.only(bottom: C.ar(x) * 16),
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }

  static Divider dv(context) =>
      Divider(height: C.ar(context) * 10, color: Colors.black, thickness: 1);

  static TextButton textButtonWithLaunch(
      BuildContext context, String type, String text) {
    String leadingText;
    switch (type) {
      case "email":
        leadingText = "mailto:";
        break;
      case "phone":
        leadingText = "tel:";
        break;
      case "web":
        leadingText = "https://";
        break;
      default:
        leadingText = "https://";
    }
    return TextButton(
        onPressed: () {
          launch(leadingText + text);
        },
        child: Text("info@noxdigital.com",
            style: S.longtextstyle(context: context)));
  }

  static Widget textButtonWithPush(
      {String text = "",
      String route = "",
      TextStyle? style,
      required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: C.w(context) * 0.175),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/$route');
        },
        style: S.roundedButtonStyle(),
        child: FittedBox(
            fit: BoxFit.contain,
            child: Text(text,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    locale: const Locale('tr'), fontWeight: FontWeight.w600),
                maxLines: 1)),
      ),
    );
  }

  static ElevatedButton elevatedButtonWithCustomFunction(
      {String text = "",
      String route = "",
      TextStyle? style,
      required BuildContext context,
      required Function() customFunction,
      dynamic fancyController}) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const CircleBorder(
              side: BorderSide(
                  color: Colors.black87, width: 0.2, style: BorderStyle.solid)),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Cr.noxColor,
        ),
      ),
      onPressed: () {
        customFunction();
        fancyController != null
            ? fancyController.open()
            : print("fancyController is null");
      },
      child: Icon(
        Icons.menu,
        color: Theme.of(context).primaryIconTheme.color,
      ),
    );
  }

  static IconButton iconButtonWithLinks(
      {IconData icon = Icons.check_box_outline_blank,
      String link = "",
      required BuildContext context}) {
    return IconButton(
      onPressed: () async {
        canLaunch(link).then((canLaunch) {
          if (canLaunch) {
            launch(link);
          } else {
            throw 'Could not launch $link';
          }
        });
      },
      icon: Icon(icon),
    );
  }
}
