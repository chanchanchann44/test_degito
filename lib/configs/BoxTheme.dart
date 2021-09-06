import 'package:flutter/material.dart';

import 'AppTheme.dart';

class BoxTheme {
  static var containerBorderRadius = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: AppTheme.white,
    boxShadow: [
      BoxShadow(
        color: AppTheme.shadow,
        blurRadius: 6,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
  );
  static var containerBorderRadiusOnlyLeft = BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(50), topRight: Radius.circular(50)),
    color: AppTheme.white,
  );
  static var containerBorderRadiusOnlyRight = BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50), topLeft: Radius.circular(50)),
    color: AppTheme.white,
  );
  static var textBorderRadius20 = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: AppTheme.shadow,
        blurRadius: 6,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
  );
}
