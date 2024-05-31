import 'package:flutter/material.dart';
import 'package:sdu_flutter/custom/screens/cus_home_screen.dart';

class CustomApp extends StatelessWidget {
  const CustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mirai App Demo',
      home: CustomHomeScreen(),
    );
  }
}
