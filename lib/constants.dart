import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'Animations Kit';
  static const String backHome = 'Back home';
  static const String myName = "Saksham Karnawat";
}

class Sizes {
  static const double defaultPadding = 15;

  static Widget defaultHorizontalSpacer() {
    return const SizedBox(width: defaultPadding);
  }

  static Widget defaultVerticalSpacer() {
    return const SizedBox(height: defaultPadding);
  }
}

class AnimationNames {
  static const String slideAndScaleDrawer = 'Slide and Scale Drawer';
  static const String scaffold3dFlip = "3D Flip Scaffold";
}

class AnimationDescriptions {
  static const String slideAndScaleDrawer =
      'A drawer that slides and scales in and out of the screen.';
  static const String scaffold3dFlip = "A 3D flip animation for Scaffold.";
}

class GifPaths {
  static const String slideAndScaleDrawer = 'assets/slide_and_scale_drawer.gif';
  static const String scaffold3dFlip = "assets/slide_and_scale_drawer.gif";
}

class PathNames {
  static const String slideAndScaleDrawer = '/slideAndScaleDrawer';
  static const String scaffold3dFlip = "/scaffold3dFlip";
}

class ColorConstants {
  static const Color primary = Colors.deepPurple;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
}

enum BolrOrNot { bold, notBold }

class TextStyles {
  static const double defaultFontSize = 24;
  static const Color defaultFontColor = Colors.black;

  static TextStyle headline1(
      {Color? color, BolrOrNot fontWeight = BolrOrNot.notBold}) {
    return TextStyle(
      fontSize: 72,
      fontWeight:
          fontWeight == BolrOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline2(
      {Color? color, BolrOrNot fontWeight = BolrOrNot.notBold}) {
    return TextStyle(
      fontSize: 36,
      fontWeight:
          fontWeight == BolrOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline3(
      {Color? color, BolrOrNot fontWeight = BolrOrNot.notBold}) {
    return TextStyle(
      fontSize: 24,
      fontWeight:
          fontWeight == BolrOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline4(
      {Color? color, BolrOrNot fontWeight = BolrOrNot.notBold}) {
    return TextStyle(
      fontSize: 20,
      fontWeight:
          fontWeight == BolrOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline5(
      {Color? color, BolrOrNot fontWeight = BolrOrNot.notBold}) {
    return TextStyle(
      fontSize: 16,
      fontWeight:
          fontWeight == BolrOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline6(
      {Color? color, BolrOrNot fontWeight = BolrOrNot.notBold}) {
    return TextStyle(
      fontSize: 14,
      fontWeight:
          fontWeight == BolrOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle bodyText1(
      {Color? color, BolrOrNot fontWeight = BolrOrNot.notBold}) {
    return TextStyle(
      fontSize: 16,
      fontWeight:
          fontWeight == BolrOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle bodyText2(
      {Color? color, BolrOrNot fontWeight = BolrOrNot.notBold}) {
    return TextStyle(
      fontSize: 14,
      fontWeight:
          fontWeight == BolrOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle caption(
      {Color? color, BolrOrNot fontWeight = BolrOrNot.notBold}) {
    return TextStyle(
      fontSize: 12,
      fontWeight:
          fontWeight == BolrOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle button(
      {Color? color, BolrOrNot fontWeight = BolrOrNot.notBold}) {
    return TextStyle(
      fontSize: 14,
      fontWeight:
          fontWeight == BolrOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }
}
