import 'package:flutter/material.dart';
import 'package:sdu_flutter/custom/custom_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Mirai.initialize();
  // runApp(const MyMiraiApp());

  runApp(const CustomApp());
}
