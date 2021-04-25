import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class NXColors {
  NXColors._();

  static const bgFilledActionButton = materialDark;
  static const bgStartGradientActionButton = orangeGradientStart;
  static const bgEndGradientActionButton = orangeGradientEnd;
  static const textPrimary = Colors.white;
  static const textSecondary = lightGrey;
  static const inputFieldFillColor = darkGrey2;
  static const bgWidgets = darkGreyOpacity18;

  static const orderStatusDefault = green;
  static const orderStatusInProgress = green;
  static const orderStatusPending = systemGrey2;
  static const orderStatusFinished = orange;
  static const orderStatusPayed = Colors.white;

  static const lightGrey = Color(0x99EBEBF5);
  static const darkGrey = Color(0xff747480);
  static const darkGreyOpacity18 = Color(0x2e747480);
  static const systemGrey = Color(0xffAEAEB2);
  static const systemGrey2 = Color(0xFF636366);
  static const darkGrey2 = Color(0x5C787880);
  static const fillDarkPrimary = Color(0xFF787880);
  static const separatorDarkGrey = Color(0xFF545458);
  static const quartenaryLightGrey = Color(0xFF787880);
  static const primaryDark = Color(0xFF3D2F23);

  static const chartBlue = Color(0xFF1565C2);

  static const backgroundBlack = Color(0xff1B120F);
  static const materialDark = Color(0x73000000);
  static const thinMaterialDark = Color(0x732a2a2a);

  static const orange = Color(0xFFFFB226);
  static const orangeGradientStart = Color(0xFFFFB226);
  static const orangeGradientEnd = Color(0xFFE89204);

  static const green = Color(0xFF3DAA17);
  static const greenGradientStart = Color(0xFF1FCD27);
  static const greenGradientEnd = Color(0xFF00AD08);
}
