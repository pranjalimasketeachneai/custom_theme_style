import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle applyCustomStyle(
      TextStyle? baseStyle, {
        Color? color,
        double? fontSize,
        FontWeight? fontWeight,
        FontStyle? fontStyle,
        double? letterSpacing,
        double? wordSpacing,
        TextBaseline? textBaseline,
        double? height,
        Locale? locale,
        Paint? foreground,
        Paint? background,
        List<Shadow>? shadows,
        List<FontFeature>? fontFeatures,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) {
    return baseStyle!.copyWith(
      color: color ?? baseStyle.color,
      fontSize: fontSize ?? baseStyle.fontSize,
      fontWeight: fontWeight ?? baseStyle.fontWeight,
      fontStyle: fontStyle ?? baseStyle.fontStyle,
      letterSpacing: letterSpacing ?? baseStyle.letterSpacing,
      wordSpacing: wordSpacing ?? baseStyle.wordSpacing,
      textBaseline: textBaseline ?? baseStyle.textBaseline,
      height: height ?? baseStyle.height,
      locale: locale ?? baseStyle.locale,
      foreground: foreground ?? baseStyle.foreground,
      background: background ?? baseStyle.background,
      shadows: shadows ?? baseStyle.shadows,
      fontFeatures: fontFeatures ?? baseStyle.fontFeatures,
      decoration: decoration ?? baseStyle.decoration,
      decorationColor: decorationColor ?? baseStyle.decorationColor,
      decorationStyle: decorationStyle ?? baseStyle.decorationStyle,
      decorationThickness: decorationThickness ?? baseStyle.decorationThickness,
    );
  }
}

