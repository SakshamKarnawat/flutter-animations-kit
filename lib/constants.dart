import 'package:flutter/material.dart';

class AppConstants {
  static const String kAppName = 'Animations Kit';
}

class AnimationNames {
  static const String slideAndScaleDrawer = 'Slide and Scale Drawer';
}

class AnimationDescriptions {
  static const String slideAndScaleDrawer =
      'A drawer that slides and scales in and out of the screen.';
}

class PathNames {
  static const String slideAndScaleDrawer = '/slideAndScaleDrawer';
}

class ColorConstants {
  static const Color white = Colors.white;
}

class TextStyles {
  static const double defaultFontSize = 24;
  static const FontWeight defaultFontWeight = FontWeight.bold;
  static const Color defaultFontColor = Colors.black;

  static TextStyle headline1({Color? color}) {
    return TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline2({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 36,
      fontWeight: fontWeight ?? defaultFontWeight,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline3({Color? color}) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline4({Color? color}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline5({Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline6({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle bodyText1({Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle bodyText2({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle caption({Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle button({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: color ?? defaultFontColor,
    );
  }
}
