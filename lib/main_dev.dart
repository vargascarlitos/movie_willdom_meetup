import 'package:flutter/material.dart';
import 'package:movie_willdom_meetup/flavor/environment.dart';
import 'package:movie_willdom_meetup/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  EnvironmentConfig(
    flavor: Flavor.dev,
    bannerLocation: BannerLocation.topStart,
    environmentValue: EnvironmentValue(
      baseUrl: EnvironmentDartDefine.baseUrl,
      serverSelect: EnvironmentDartDefine.serverSelect,
    ),
  );

  runApp(MyApp());
}
