import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class C {
  static AppLocalizations T(BuildContext context) => AppLocalizations.of(context)!;
  static double w(BuildContext context) => MediaQuery.of(context).size.width;
  static double h(BuildContext context) => MediaQuery.of(context).size.height;
  static double ls(BuildContext context) => MediaQuery.of(context).size.longestSide;
  static double ss(BuildContext context) => MediaQuery.of(context).size.shortestSide;
  static double ar(BuildContext context) => MediaQuery.of(context).size.aspectRatio;
}