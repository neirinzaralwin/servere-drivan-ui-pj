import 'package:flutter/material.dart';
import 'package:sdu_flutter/custom/services/generator/widget_generator.dart';
import 'package:sdu_flutter/data_loader.dart';

class CustomHomeScreen extends StatefulWidget {
  const CustomHomeScreen({super.key});

  @override
  State<CustomHomeScreen> createState() => _CustomHomeScreenState();
}

class _CustomHomeScreenState extends State<CustomHomeScreen> {
  final jsonLoader = JsonLoader(path: 'assets/data/custom_data.json');
  final widgetGenerator = WidgetGenerator();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<String>(
        future: jsonLoader.load(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return widgetGenerator.generate(data: snapshot.data ?? '');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Custom SDU'),
    //   ),
    //   body: Column(
    //     children: [
    //       const Text('Custom SDU'),
    //       ElevatedButton(
    //         onPressed: () {},
    //         child: const Text('Go to somewhere'),
    //       ),
    //     ],
    //   ),
    // );
  }
}
