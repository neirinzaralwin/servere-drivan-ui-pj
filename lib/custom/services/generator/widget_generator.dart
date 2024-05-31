import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sdu_flutter/custom/services/generator/color_generator.dart';
import 'package:sdu_flutter/custom/services/generator/sdu_generator.dart';

class WidgetGenerator extends SDUGenerator {
  @override
  Widget generate({required String data}) {
    Map<String, dynamic> parsedJson = json.decode(data);
    return _buildWidget(parsedJson);
  }

  Widget _buildWidget(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'Scaffold':
        return Scaffold(
          appBar: json['appBar'] != null
              ? _buildWidget(json['appBar']) as AppBar
              : null,
          body: json['body'] != null ? _buildWidget(json['body']) : null,
        );
      case 'AppBar':
        return AppBar(
          title: json['title'] != null ? _buildWidget(json['title']) : null,
          backgroundColor: json['backgroundColor'] != null
              ? ColorGenerator()
                  .generate(data: json["backgroundColor"] as String)
              : null,
        );
      case 'Center':
        return Center(
          child: json['child'] != null ? _buildWidget(json['child']) : null,
        );
      case 'Column':
        return Column(
          mainAxisAlignment: _parseMainAxisAlignment(json['mainAxisAlignment']),
          children: (json['children'] as List)
              .map((child) => _buildWidget(child))
              .toList(),
        );
      case 'Text':
        return Text(json['data'] ?? '');
      case 'SizedBox':
        return SizedBox(height: json['height']?.toDouble() ?? 0);
      case 'ElevatedButton':
        return ElevatedButton(
          onPressed: () {
            if (json['onPressed'] == 'onButtonPressed') {
              debugPrint('Button pressed');
            }
          },
          child: json['child'] != null ? _buildWidget(json['child']) : null,
        );
      default:
        return const Center(child: Text("Unknown widget"));
    }
  }

  MainAxisAlignment _parseMainAxisAlignment(String alignment) {
    switch (alignment) {
      case 'center':
        return MainAxisAlignment.center;
      case 'start':
        return MainAxisAlignment.start;
      case 'end':
        return MainAxisAlignment.end;
      default:
        return MainAxisAlignment.start;
    }
  }
}
