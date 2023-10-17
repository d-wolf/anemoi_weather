import 'package:shared_preferences/shared_preferences.dart';

abstract class SelectedLocationLocalDataSource {
  SelectedLocationLocalDataSource();

  bool exists();
  Future<void> write(int id);
  int read();
  Future<void> clear();
}

class SelectedLocationLocalDataSourceImpl
    implements SelectedLocationLocalDataSource {
  static const key = 'selected_location_key';

  final SharedPreferences _prefs;

  SelectedLocationLocalDataSourceImpl(this._prefs);

  @override
  bool exists() {
    return _prefs.containsKey(key);
  }

  @override
  Future<void> write(int id) async {
    final success = await _prefs.setInt(key, id);
    if (!success) throw Exception('Unable to write.');
  }

  @override
  int read() {
    return _prefs.getInt(key)!;
  }

  @override
  Future<void> clear() async {
    await _prefs.remove(key);
  }
}
