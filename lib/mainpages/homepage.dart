// ignore_for_file: avoid_print

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noxdigitalweb/constants/colors.dart';
import 'package:noxdigitalweb/constants/constants.dart';
import 'package:noxdigitalweb/constants/skeletons.dart';
import 'package:noxdigitalweb/constants/stringspaths.dart';
import 'package:noxdigitalweb/constants/styles.dart';
import 'package:noxdigitalweb/constants/widgets.dart';
import 'package:noxdigitalweb/drawer/controller.dart';
import 'package:noxdigitalweb/drawer/drawerstate.dart';
import 'package:noxdigitalweb/drawer/fancydrawerwrapper.dart';
import 'package:skeletons/skeletons.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late FancyDrawerController _fancyController;
  late TabController _tabController;
  late PageController _pageController;
  int lastindex = 1;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0, keepPage: true);
    _tabController = TabController(initialIndex: 1, length: 3, vsync: this);
    _fancyController = FancyDrawerController(
        vsync: this, duration: const Duration(milliseconds: 400))
      ..addListener(() async {
        switch (_fancyController.state) {
          case DrawerState.opening:
            print("opening");
            break;
          case DrawerState.closing:
            print("closing");
            break;
          case DrawerState.closed:
            print("closed");
            if (_pageController.page!.round() + 1 == 1) {
              _tabController.animateTo(1,
                  duration: const Duration(milliseconds: 150));
            } else {
              _tabController.animateTo(1,
                  duration: const Duration(milliseconds: 1));
              Future.delayed(const Duration(milliseconds: 30), () {
                _tabController.animateTo(2,
                    duration: const Duration(milliseconds: 150));
              });
            }
            break;
          case DrawerState.opened:
            print("opened");
            break;
          default:
        }
        setState(() {}); // Must call setState
      }); // This chunk of code is important
    super.initState();
  }

  @override
  void dispose() {
    _fancyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FancyDrawerWrapper(
        backgroundColor: Colors.white,
        controller: _fancyController,
        hideOnContentTap: true,
        cornerRadius: 20,
        drawerPadding: EdgeInsets.only(right: C.w(context) * 0.3),
        drawerItems: <Widget>[
          textButtonWithPushFor(context, "aboutus", C.T(context).whorwe),
          textButtonWithPushFor(context, "services", C.T(context).whatrwedoin),
          textButtonWithPushFor(
              context, "products", C.T(context).whathavewedone),
          textButtonWithPushFor(context, "customers", C.T(context).customers),
          textButtonWithPushFor(context, "settings", C.T(context).settings),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              iconButtonWithLinksFor(context, FontAwesomeIcons.github,
                  "https://www.github.com/noxdigital"),
              iconButtonWithLinksFor(context, FontAwesomeIcons.linkedin,
                  "https://www.linkedin.com/company/noxdigital")
            ],
          ),
          W.textButtonWithLaunch(context, "email", "info@noxdigital.com")
        ],
        child: Scaffold(
          bottomNavigationBar: W.getBottomAppBar(
              context: context,
              fancyController: _fancyController,
              tabController: _tabController,
              pageController: _pageController,
              lastindex: lastindex),
          /* floatingActionButton: FloatingActionButton(
            onPressed: () {
              bool check(String word) {
                String noktalamapattern =
                    r'''^[!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]''';
                String numarapattern = r'^[0-9]';
                RegExp punctation = RegExp(noktalamapattern);
                RegExp number = RegExp(numarapattern);
                for (int i = 0; i < word.length; i++) {
                  if (i < word.length - 3) {
                    if (word[i] == word[i + 1] && word[i + 1] == word[i + 2]) {
                      return false;
                    } else if (punctation.hasMatch(word[i]) ||
                        number.hasMatch(word[i])) {
                      if (word[i] != word[i + 1] ||
                          (word[i] == word[i + 1] &&
                              word[i + 1] == word[i + 2])) {
                        return false;
                      }
                    }
                  } else {
                    try {
                      if (punctation.hasMatch(word[i]) ||
                          number.hasMatch(word[i])) {
                        if (word[i] != word[i + 1]) {
                          return false;
                        } else if ((word[i] == word[i + 1] &&
                            word[i + 1] == word[i + 2])) {
                          return false;
                        }
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                }
                return true;
              }
              bool result = check("raaandomize11");
              print("result is $result");
            },
            child: Icon(Icons.question_mark),
          ), */
          body: PageView(
              controller: _pageController,
              pageSnapping: true,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: C.h(context) * 0.050,
                          bottom: C.h(context) * 0.025),
                      child: Image.asset(Paths.noxlogo, scale: 1.5),
                    ),
                    Flexible(
                      child: Skeleton(
                        isLoading: true,
                        skeleton: Skeletons.skeletonListView,
                        child: Container(),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    /* Padding(
                  padding: EdgeInsets.only(
                      top: C.h(context) * 0.050, bottom: C.h(context) * 0.025),
                  child: Image.asset(Paths.noxlogo, scale: 1.5),
                ), */
                    Flexible(
                      child: Skeleton(
                        isLoading: true,
                        skeleton: Skeletons.skeletonAvatar,
                        child: Container(),
                      ),
                    ),
                    Flexible(
                      child: Skeleton(
                        isLoading: true,
                        skeleton: Skeletons.skeletonParagraph,
                        child: Container(),
                      ),
                    ),
                    Flexible(
                      child: Skeleton(
                        isLoading: true,
                        skeleton: Skeletons.skeletonItem,
                        child: Container(),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }

  textButtonWithPushFor(context, route, text) {
    return W.textButtonWithPush(
        context: context,
        route: route,
        text: text,
        style: S.appbartextstyle(context: context));
  }

  iconButtonWithLinksFor(context, icon, link) {
    return Material(
      child: W.iconButtonWithLinks(context: context, icon: icon, link: link),
    );
  }
}
