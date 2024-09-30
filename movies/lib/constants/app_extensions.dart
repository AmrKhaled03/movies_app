import 'package:flutter/material.dart';

extension NumberExtension on num {
  SizedBox get gap => SizedBox(
        height: toDouble(),
        width: toDouble(),
      );
}