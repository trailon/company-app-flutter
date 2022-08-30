import 'package:flutter/material.dart';
import 'package:noxdigitalweb/constants/constants.dart';

class S {
  static TextStyle appbartextstyle(
          {required BuildContext context,
          FontWeight? fW,
          double factor = 40,
          Color cR = Colors.white}) =>
      TextStyle(
        color: cR,
        fontSize: C.ar(context) * factor,
        fontWeight: fW,
      );

  static TextStyle longtextstyle(
          {required BuildContext context,
          FontWeight? fW,
          double factor = 32.5,
          Color cR = Colors.black87}) =>
      TextStyle(
        color: cR,
        fontSize: C.ar(context) * factor,
        fontWeight: fW,
      );
  
  static ButtonStyle roundedButtonStyle(
      {Color cR = const Color(0xFF1C3E87), TextStyle? tS}) {
    return ButtonStyle(
      textStyle: (tS != null) ? MaterialStateProperty.all(tS) : null,
      backgroundColor: MaterialStateProperty.all(cR),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      )),
    );
  }
}
