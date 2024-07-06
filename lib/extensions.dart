import 'package:flutter/material.dart';

extension MySize on int {
  SizedBox toHeight() => SizedBox(
        height: toDouble(),
      );
  SizedBox toWidth() => SizedBox(
        width: toDouble(),
      );
}
