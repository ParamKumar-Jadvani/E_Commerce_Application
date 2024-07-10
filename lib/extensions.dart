import 'package:flutter/material.dart';

extension MySize on int {
  SizedBox toHeight() => SizedBox(
        height: toDouble(),
      );
  SizedBox toWidth() => SizedBox(
        width: toDouble(),
      );
}

extension StringVal on String {
  String get tCase => replaceFirst(this[0], this[0].toUpperCase());
}
