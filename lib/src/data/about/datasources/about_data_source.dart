import 'package:anemoi_weather/src/core/res/app_assets.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

abstract class AboutDataSource {
  Future<String> getVersion();
  Future<String> getText();
}

class AboutDataSourceImpl implements AboutDataSource {
  @override
  Future<String> getText() async {
    final str = await rootBundle.loadString(AppAssets.license);
    return str;
  }

  @override
  Future<String> getVersion() async {
    final info = await PackageInfo.fromPlatform();
    return info.version;
  }
}
