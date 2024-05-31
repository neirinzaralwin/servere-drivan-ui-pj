import 'package:flutter/material.dart';
import 'package:mirai/mirai.dart';
import 'package:sdu_flutter/mirai/screens/mirai_home_screen.dart';

class MyMiraiApp extends StatelessWidget {
  const MyMiraiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MiraiApp(
      title: 'Mirai App Demo',
      homeBuilder: (context) => const MiraiHomeScreen(),
    );
  }
}
