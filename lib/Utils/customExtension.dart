import 'package:flutter/material.dart';

extension CustomExtension on Widget {
  Widget addPadding() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: this,
    );
  }
}
