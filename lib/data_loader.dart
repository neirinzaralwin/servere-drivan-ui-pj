import 'package:flutter/services.dart';

abstract class DataLoader {
  load();
}

class JsonLoader extends DataLoader {
  final String path;
  JsonLoader({required this.path});

  @override
  Future<String> load() async {
    return await rootBundle.loadString(path);
  }
}
