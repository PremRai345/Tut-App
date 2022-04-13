import 'package:flutter/material.dart';
import 'fonts_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

//regukar style
TextStyle getRegularStyle(
    {double fontSize = FontSizeManager.s6, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightmanager.regular, color);
}

//light text style

TextStyle getRegularLightStyle(
    {double fontSize = FontSizeManager.s6, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightmanager.light, color);
}

// bold text style
TextStyle getBoldStyle(
    {double fontSize = FontSizeManager.s6, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightmanager.bold, color);
}

// semi bold text style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSizeManager.s6, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightmanager.semiBold, color);
}

// medium text style
TextStyle getMediumStyle(
    {double fontSize = FontSizeManager.s6, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightmanager.medium, color);
}
