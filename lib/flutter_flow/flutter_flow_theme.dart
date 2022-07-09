// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences _prefs;

abstract class FlutterFlowTheme {
  set white(Color white) {}

  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

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
  Color primaryColor = const Color(0xFF39D2C0);
  Color secondaryColor = const Color(0xFF249689);
  Color tertiaryColor = const Color(0xFFFFA077);
  Color alternate = const Color(0xFFF3F7FD);
  Color primaryBackground = const Color(0xFFEFF7F5);
  Color secondaryBackground = const Color(0xFFFFFFFF);
  Color primaryText = const Color(0xFF111417);
  Color secondaryText = const Color(0xFF57636C);
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

  String get title1Family => 'Roboto';
  TextStyle get title1 => GoogleFonts.getFont(
        'Roboto',
      );
  String get title2Family => 'Roboto';
  TextStyle get title2 => GoogleFonts.getFont(
        'Roboto',
      );
  String get title3Family => 'Roboto';
  TextStyle get title3 => GoogleFonts.getFont(
        'Roboto',
      );
  String get subtitle1Family => 'Roboto';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Roboto',
      );
  String get subtitle2Family => 'Roboto';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Roboto',
      );
  String get bodyText1Family => 'Roboto';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Roboto',
      );
  String get bodyText2Family => 'Roboto';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Roboto',
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF39D2C0);
  Color secondaryColor = const Color(0xFF249689);
  Color tertiaryColor = const Color(0xFFFFA077);
  Color alternate = const Color(0xFF262D34);
  Color primaryBackground = const Color(0xFF1A1F24);
  Color secondaryBackground = const Color(0xFF111417);
  Color primaryText = const Color(0xFFFFFFFF);
  Color secondaryText = const Color(0xFF95A1AC);
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
