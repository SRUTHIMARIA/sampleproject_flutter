import 'package:flutter/material.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';

class StaticPadding {
  static EdgeInsetsGeometry paddingH10(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: context.widthPx * 10);
  }
  static EdgeInsetsGeometry paddingH30(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: context.widthPx * 30);
  }
  static EdgeInsetsGeometry paddingH50(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: context.widthPx * 40);
  }
  static EdgeInsetsGeometry paddingH40(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: context.widthPx * 40);
  }

  static EdgeInsetsGeometry paddingH60(BuildContext context) {
  return EdgeInsets.symmetric(horizontal: context.widthPx * 60);
  }


  static EdgeInsetsGeometry paddingH50V40(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: context.widthPx * 50, vertical: context.heightPx * 40);
  }

  static EdgeInsetsGeometry paddingH25V10(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: context.widthPx * 25, vertical: context.heightPx * 10);
  }

}
