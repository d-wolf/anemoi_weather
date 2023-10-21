import 'dart:io';

class FixtureReader {
  static String read(String path) => File(path).readAsStringSync();
}
