import 'package:e_com_app/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class ESpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: ESizes.appBarHeight,
    left: ESizes.defaultSpace,
    bottom: ESizes.defaultSpace,
    right: ESizes.defaultSpace,
  );
}