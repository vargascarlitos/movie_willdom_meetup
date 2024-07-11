import 'package:flutter/material.dart';
import 'package:movie_willdom_meetup/flavor/environment_config.dart';
import 'package:movie_willdom_meetup/flavor/environment_values.dart';
import 'package:movie_willdom_meetup/flavor/flavor.dart';
import 'package:movie_willdom_meetup/my_app.dart';

import 'flavor/environment_dart_define.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Se inicializa el [EnvironmentConfig]
  ///
  /// Se aclara que todos los valores se obtienen del comando
  /// '''--dart-define'''. Estos pueden provenir de:
  ///  * La configuración de deploy de Android Studio.
  ///  * El archivo `launch.json` de VScode.
  ///  * La terminal
  EnvironmentConfig(
    flavor: Flavor.prod,
    bannerLocation: BannerLocation.topStart,
    environmentValue: EnvironmentValue(
      baseUrl: EnvironmentDartDefine.baseUrl,
      serverSelect: EnvironmentDartDefine.serverSelect,
    ),
  );

  runApp(
    MyApp(),
  );
}
