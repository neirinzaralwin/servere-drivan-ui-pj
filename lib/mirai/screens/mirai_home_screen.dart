import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mirai/mirai.dart';
import 'package:sdu_flutter/data_loader.dart';

class MiraiHomeScreen extends StatefulWidget {
  const MiraiHomeScreen({super.key});

  @override
  State<MiraiHomeScreen> createState() => _MiraiHomeScreenState();
}

class _MiraiHomeScreenState extends State<MiraiHomeScreen> {
  final jsonLoader = JsonLoader(path: 'assets/data/raw_data.json');

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<String>(
        future: jsonLoader.load(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Mirai.fromJson(json.decode(snapshot.data ?? ''), context) ??
                Container();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
