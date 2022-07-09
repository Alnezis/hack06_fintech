// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color grayIcon;
  Color gray200;
  Color gray600;
  Color black600;
  Color tertiary400;
  Color textColor;
  Color outrageousOrange;
  Color maximumPurple;
  Color middleBlue;
  Color white;
  Color englishViolet;
  Color cultured;
  Color richBlackFOGRA29;
  Color mountbattenPink;
  Color bone;
  Color lilacLuster;
  Color primaryBtnText;
  Color lineColor;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF94CED5);
  Color secondaryColor = const Color(0xFF8A47A1);
  Color tertiaryColor = const Color(0xFFF8693E);
  Color alternate = const Color(0xFFF3F7FD);
  Color primaryBackground = const Color(0xFFF4F3F2);
  Color secondaryBackground = const Color(0xFFEAE1D5);
  Color primaryText = const Color(0xFF141721);
  Color secondaryText = const Color(0xFF462C50);

  Color grayIcon = Color(0xFF95A1AC);
  Color gray200 = Color(0xFFDBE2E7);
  Color gray600 = Color(0xFF262D34);
  Color black600 = Color(0xFF090F13);
  Color tertiary400 = Color(0xFF39D2C0);
  Color textColor = Color(0xFF1E2429);
  Color outrageousOrange = Color(0xFFF8693E);
  Color maximumPurple = Color(0xFF70367B);
  Color middleBlue = Color(0xFF94CED5);
  Color white = Color(0xFFFEFEFE);
  Color englishViolet = Color(0xFF462C50);
  Color cultured = Color(0xFFF4F3F2);
  Color richBlackFOGRA29 = Color(0xFF141721);
  Color mountbattenPink = Color(0xFF907083);
  Color bone = Color(0xFFEAE1D5);
  Color lilacLuster = Color(0xFFAD99B0);
  Color primaryBtnText = Color(0xFFFFFFFF);
  Color lineColor = Color(0xFFE0E3E7);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Rubik';
  TextStyle get title1 => GoogleFonts.getFont(
        'Rubik',
      );
  String get title2Family => 'Rubik';
  TextStyle get title2 => GoogleFonts.getFont(
        'Rubik',
      );
  String get title3Family => 'Rubik';
  TextStyle get title3 => GoogleFonts.getFont(
        'Rubik',
      );
  String get subtitle1Family => 'Rubik';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Rubik',
      );
  String get subtitle2Family => 'Rubik';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Rubik',
      );
  String get bodyText1Family => 'Rubik';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Rubik',
      );
  String get bodyText2Family => 'Rubik';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Rubik',
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    double letterSpacing,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
