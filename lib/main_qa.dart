import 'package:flutter/material.dart';
import 'package:movie_willdom_meetup/flavor/environment_config.dart';
import 'package:movie_willdom_meetup/flavor/environment_dart_define.dart';
import 'package:movie_willdom_meetup/flavor/environment_values.dart';
import 'package:movie_willdom_meetup/flavor/flavor.dart';
import 'package:movie_willdom_meetup/models/flutter_error_logs.dart';
import 'package:movie_willdom_meetup/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  List<FlutterErrorLog> errorLogs = [];

  /// Se inicializa el [EnvironmentConfig]
  ///
  /// Se aclara que todos los valores se obtienen del comando
  /// '''--dart-define'''. Estos pueden provenir de:
  ///  * La configuración de deploy de Android Studio.
  ///  * El archivo `launch.json` de VScode.
  ///  * La terminal
  EnvironmentConfig(
    flavor: Flavor.qa,
    bannerLocation: BannerLocation.bottomEnd,
    environmentValue: EnvironmentValue(
      baseUrl: EnvironmentDartDefine.baseUrl,
      serverSelect: EnvironmentDartDefine.serverSelect,
    ),
  );

  runApp(
    MyApp(
      errorLogs: errorLogs,
    ),
  );

  /// Se capturan los errores de la aplicación
  /// y se almacenan en la lista [errorLogs]
  FlutterError.onError = (FlutterErrorDetails details) {
    errorLogs.add(FlutterErrorLog(
      message: details.exceptionAsString(),
      stackTrace: details.stack.toString(),
      timestamp: DateTime.now(),
    ));
    FlutterError.dumpErrorToConsole(details);
  };
}
