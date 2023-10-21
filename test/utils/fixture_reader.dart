import 'dart:io';

import 'package:path/path.dart' as p;

class FixtureReader {
  FixtureReader({required this.basePath});
  final String basePath;

  String read(String fileName) =>
      File(p.join(basePath, fileName)).readAsStringSync();
}
