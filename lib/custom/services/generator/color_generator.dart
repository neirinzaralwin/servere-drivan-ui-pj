import 'package:flutter/material.dart';

class ColorGenerator {
  Color generate({required String data}) {
    final buffer = StringBuffer();
    if (data.length == 6 || data.length == 7) buffer.write('ff');
    buffer.write(data.replaceFirst('#', ''));
    int? intColor = int.tryParse(buffer.toString(), radix: 16);
    intColor = intColor ?? 0x00000000;
    return Color(intColor);
  }
}
