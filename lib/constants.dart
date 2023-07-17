import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'Animations Kit';
  static const String backHome = 'Back home';
  static const String myName = "Saksham Karnawat";
}

class Sizes {
  static const double defaultPadding = 15;
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
  static const Color primary = Colors.deepPurple;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
}

enum boldOrNot { bold, notBold }

class TextStyles {
  static const double defaultFontSize = 24;
  static const Color defaultFontColor = Colors.black;

  static TextStyle headline1(
      {Color? color, boldOrNot fontWeight = boldOrNot.notBold}) {
    return TextStyle(
      fontSize: 72,
      fontWeight:
          fontWeight == boldOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline2(
      {Color? color, boldOrNot fontWeight = boldOrNot.notBold}) {
    return TextStyle(
      fontSize: 36,
      fontWeight:
          fontWeight == boldOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline3(
      {Color? color, boldOrNot fontWeight = boldOrNot.notBold}) {
    return TextStyle(
      fontSize: 24,
      fontWeight:
          fontWeight == boldOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline4(
      {Color? color, boldOrNot fontWeight = boldOrNot.notBold}) {
    return TextStyle(
      fontSize: 20,
      fontWeight:
          fontWeight == boldOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline5(
      {Color? color, boldOrNot fontWeight = boldOrNot.notBold}) {
    return TextStyle(
      fontSize: 16,
      fontWeight:
          fontWeight == boldOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle headline6(
      {Color? color, boldOrNot fontWeight = boldOrNot.notBold}) {
    return TextStyle(
      fontSize: 14,
      fontWeight:
          fontWeight == boldOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle bodyText1(
      {Color? color, boldOrNot fontWeight = boldOrNot.notBold}) {
    return TextStyle(
      fontSize: 16,
      fontWeight:
          fontWeight == boldOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle bodyText2(
      {Color? color, boldOrNot fontWeight = boldOrNot.notBold}) {
    return TextStyle(
      fontSize: 14,
      fontWeight:
          fontWeight == boldOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle caption(
      {Color? color, boldOrNot fontWeight = boldOrNot.notBold}) {
    return TextStyle(
      fontSize: 12,
      fontWeight:
          fontWeight == boldOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }

  static TextStyle button(
      {Color? color, boldOrNot fontWeight = boldOrNot.notBold}) {
    return TextStyle(
      fontSize: 14,
      fontWeight:
          fontWeight == boldOrNot.bold ? FontWeight.bold : FontWeight.normal,
      color: color ?? defaultFontColor,
    );
  }
}
