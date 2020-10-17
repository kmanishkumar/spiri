import 'dart:io';

import 'package:flutter/material.dart';

class UIService {
  static getPaddingTopApp(context) {
    return Platform.isAndroid
        ? MediaQuery.of(context).padding.top
        : MediaQuery.of(context).padding.top + 14;
  }

  static getRoundedCorners(double val) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(val));
  }
}
